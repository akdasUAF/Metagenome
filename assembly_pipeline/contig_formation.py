from collections import defaultdict, deque
from concurrent.futures import ThreadPoolExecutor
import os
import dask
import dask.bag as db
import sys
sys.path.insert(0, "/home/gauri/Metagenomics/Metagenome/Gauri/metagenomics_main")
from graph_utils import remove_tips_cython, remove_bubbles_cython, build_contigs_parallel_cython


def remove_tips(graph, min_tip_length=100, npartitions=8):
    """
    Parallel tip removal using Dask.
    graph: dict of node -> set(neighbors)
    min_tip_length: max length of tip paths to remove
    npartitions: number of parallel partitions
    """
    all_nodes = list(graph.keys())

    def process_node(node):
        tips_local = set()
        # Tip detection
        if len(graph.get(node, [])) == 1 or all(len(graph.get(n, [])) <= 1 for n in graph.get(node, [])):
            path = [node]
            current = node
            while current in graph and len(graph.get(current, [])) == 1:
                next_node = next(iter(graph[current]))
                path.append(next_node)
                current = next_node
                if len(path) > min_tip_length:
                    break
            if len(path) <= min_tip_length:
                tips_local.update(path)
        return tips_local

    # Create Dask bag and process in parallel
    bag = db.from_sequence(all_nodes, npartitions=npartitions)
    tips_found = bag.map(process_node).compute()

    # Flatten set of tips
    tips_to_remove = set().union(*tips_found)

    # Remove tips from graph
    for tip in tips_to_remove:
        graph.pop(tip, None)
    for node in graph:
        graph[node] -= tips_to_remove

    print(f"Tips removed: {len(tips_to_remove)}")
    return graph

# Step 2: Remove Bubbles
def remove_bubbles(graph, coverage_map=None, max_bubble_len=200, npartitions=8):
    """
    Parallel bubble removal using Dask.
    
    Parameters:
        graph (dict): {node: set(neighbors)}
        coverage_map (dict): Optional {node: coverage_value}, used to pick the likely erroneous path
        max_bubble_len (int): Maximum length (in kmers) to consider a path a bubble
        npartitions (int): Number of Dask partitions for parallelism
    
    Returns:
        dict: Graph with bubbles removed
    """
    def find_path_to_merge(start, max_len):
        """Walk forward until paths merge or exceed length limit."""
        visited = set()
        queue = deque([(start, [start])])

        while queue:
            node, path = queue.popleft()
            if node in visited:
                return path  # merge point found
            visited.add(node)
            if len(path) > max_len:
                return None  # too long
            for nxt in graph.get(node, []):
                queue.append((nxt, path + [nxt]))
        return None

    def process_start_node(start):
        local_to_remove = set()
        neighbors = list(graph.get(start, []))
        if len(neighbors) > 1:  # possible bubble start
            for i in range(len(neighbors)):
                for j in range(i + 1, len(neighbors)):
                    path1 = find_path_to_merge(neighbors[i], max_bubble_len)
                    path2 = find_path_to_merge(neighbors[j], max_bubble_len)
                    if path1 and path2 and path1[-1] == path2[-1]:
                        if coverage_map:
                            cov1 = sum(coverage_map.get(k, 1) for k in path1) / len(path1)
                            cov2 = sum(coverage_map.get(k, 1) for k in path2) / len(path2)
                            if cov1 < cov2:
                                local_to_remove.update(path1)
                            else:
                                local_to_remove.update(path2)
                        else:
                            if len(path1) < len(path2):
                                local_to_remove.update(path1)
                            else:
                                local_to_remove.update(path2)
        return local_to_remove

    # Parallel bubble detection
    bag = db.from_sequence(list(graph.keys()), npartitions=npartitions)
    results = bag.map(process_start_node).compute()

    # Merge all removal candidates
    to_remove = set().union(*results)

    # Remove from graph
    for node in to_remove:
        graph.pop(node, None)
    for k in graph:
        graph[k] -= to_remove

    print(f"Bubbles removed: {len(to_remove)}")
    return graph

# Step 3: Build Contigs
def build_contigs_parallel(graph):
    visited = set()
    contigs = []

    def worker(start):
        if start in visited:
            return None
        path = []
        kmer = start
        while kmer and kmer not in visited:
            visited.add(kmer)
            path.append(kmer)
            next_nodes = list(graph.get(kmer, []))
            kmer = next_nodes[0] if next_nodes else None
        return "".join(path) if path else None

    with ThreadPoolExecutor() as executor:
        results = executor.map(worker, list(graph.keys()))
    return [c for c in results if c]

# Main Workflow for Contig Generation
def generate_contigs(subgraphs, cleanup_rounds=2):
    all_contigs = {}
    for cluster_id, graph in subgraphs.items():
        print(f"Processing Sub-Graph: {cluster_id}")

        # Multiple rounds of tip and bubble removal
        for _ in range(cleanup_rounds):
            graph = remove_tips_cython(graph, 100)

            # graph = remove_tips(graph)
            # graph = remove_bubbles(graph)
            graph = remove_bubbles_cython(graph)

        contigs = build_contigs_parallel_cython(graph)
        all_contigs[cluster_id] = contigs

    return all_contigs
