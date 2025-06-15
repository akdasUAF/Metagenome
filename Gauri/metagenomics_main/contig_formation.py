from collections import defaultdict, deque
from concurrent.futures import ThreadPoolExecutor
import os

# Step 1: Remove Tips
def remove_tips(de_bruijn_graph):
    tips = set()
    for kmer, connections in de_bruijn_graph.items():
        if len(connections) == 1:
            next_kmer = list(connections)[0]
            if len(de_bruijn_graph.get(next_kmer, [])) > 1:
                tips.add(kmer)

    for tip in tips:
        de_bruijn_graph.pop(tip, None)  # Safely remove tips
        for kmer in de_bruijn_graph:
            de_bruijn_graph[kmer].discard(tip)

    print(f"Tips removed: {len(tips)}")
    return de_bruijn_graph

# Step 2: Remove Bubbles
def remove_bubbles(graph):
    def find_bubble_paths(start_kmer, graph):
        if start_kmer not in graph:
            return []

        paths = []
        queue = deque([(start_kmer, [start_kmer])])
        visited = set()

        while queue and len(paths) < 2:  # Only need two paths for a bubble
            current_kmer, path = queue.popleft()

            if current_kmer not in graph:
                continue  # Skip if the k-mer has been removed

            # End condition: a k-mer with multiple outgoing edges
            if len(graph[current_kmer]) > 1:
                paths.append(path)
                if len(paths) == 2:
                    return paths

            # Explore outgoing edges
            for next_kmer in graph.get(current_kmer, []):
                if next_kmer not in visited:
                    visited.add(next_kmer)
                    queue.append((next_kmer, path + [next_kmer]))

        return paths

    def resolve_bubble(paths, graph):
        path_lengths = [len(path) for path in paths]
        shorter_path = paths[path_lengths.index(min(path_lengths))]
        for kmer in shorter_path:
            graph.pop(kmer, None)  # Safely remove kmers from the graph
            for adj in graph:
                graph[adj].discard(kmer)

    for start_kmer in list(graph.keys()):
        paths = find_bubble_paths(start_kmer, graph)
        if len(paths) == 2:
            resolve_bubble(paths, graph)
    
    print("Bubbles resolved.")
    return graph

# Step 3: Build Contigs
def traverse_graph(kmer, graph, visited):
    path = []
    while kmer and kmer not in visited:
        visited.add(kmer)
        path.append(kmer)
        next_nodes = list(graph.get(kmer, []))  # Safely get next nodes
        kmer = next_nodes[0] if len(next_nodes) == 1 else None
    return "".join(path)

def build_contigs_parallel(graph):
    contigs = []
    visited = set()
    
    with ThreadPoolExecutor() as executor:
        futures = [
            executor.submit(traverse_graph, kmer, graph, visited)
            for kmer in list(graph.keys()) if kmer not in visited
        ]
        for i, future in enumerate(futures, 1):
            try:
                result = future.result()
                if result:
                    contigs.append(result)
                    print(f"Contig {i}: {result}")
            except KeyError as e:
                print(f"KeyError during contig generation: {e}")
    
    return contigs

# Main Workflow for Contig Generation
def generate_contigs(subgraphs, cleanup_rounds=2):
    all_contigs = {}
    for cluster_id, graph in subgraphs.items():
        print(f"Processing Sub-Graph: {cluster_id}")

        # Multiple rounds of tip and bubble removal
        for _ in range(cleanup_rounds):
            graph = remove_tips(graph)
            graph = remove_bubbles(graph)

        contigs = build_contigs_parallel(graph)
        all_contigs[cluster_id] = contigs

    return all_contigs


def write_contigs_to_files(contigs_by_subgraph, output_dir="output"):
    os.makedirs(output_dir, exist_ok=True)
    summary_file = os.path.join(output_dir, "summary.txt")
    
    with open(summary_file, "w") as summary:
        for cluster_id, contigs in contigs_by_subgraph.items():
            cluster_file = os.path.join(output_dir, f"{cluster_id}_contigs.txt")
            
            with open(cluster_file, "w") as f:
                f.write("\n".join(contigs))
            
            # Log summary for each cluster
            summary.write(
                f"Cluster: {cluster_id}\n"
                f"Contigs Count: {len(contigs)}\n"
                f"Output File: {cluster_file}\n\n"
            )
