from collections import defaultdict, deque
from itertools import islice
from Bio import SeqIO
import numpy as np
from sklearn.cluster import KMeans
import dask
from dask import delayed, compute

# Step 1: Parse Reads
def parse_reads(fastq_file):
    return [str(record.seq) for record in SeqIO.parse(fastq_file, "fastq")]

# Step 2: Construct de Bruijn Graph
def generate_kmers(read, k):
    return [read[i:i+k] for i in range(len(read) - k + 1)]

def construct_de_bruijn_graph(reads, k):
    graph = defaultdict(set)
    for read in reads:
        kmers = generate_kmers(read, k)
        for i in range(len(kmers) - 1):
            graph[kmers[i]].add(kmers[i + 1])
    return graph

# TODO: reverse complement of the reverse read - different read
def extract_paired_end_reads(fastq_file):
    paired_reads = []
    with open(fastq_file, "r") as f:
        records = list(SeqIO.parse(f, "fastq"))
        for i in range(0, len(records), 2):
            read1 = str(records[i].seq)
            read2 = str(records[i + 1].seq)
            paired_reads.append((read1, read2))
    return paired_reads

# Step 3: Annotate Nodes with Coverage
def annotate_coverage(reads, k):
    coverage_map = defaultdict(int)
    for read in reads:
        kmers = generate_kmers(read, k)
        for kmer in kmers:
            coverage_map[kmer] += 1
    return coverage_map

# Step 4: Cluster Nodes by Coverage
# n coverage bin
def cluster_by_coverage(coverage_map, n_clusters):
    kmers = list(coverage_map.keys())
    coverage_values = np.array(list(coverage_map.values())).reshape(-1, 1)
    kmeans = KMeans(n_clusters=n_clusters, random_state=0)
    labels = kmeans.fit_predict(coverage_values)
    clusters = defaultdict(set)
    for kmer, label in zip(kmers, labels):
        clusters[label].add(kmer)
    return clusters

# Step 5: Refine Clusters Using GC Content
def calculate_gc_content(kmer):
    gc_count = kmer.count('G') + kmer.count('C')
    return (gc_count / len(kmer)) * 100

# TODO: cluster based on GC inside coverage clusters
def refine_clusters_with_gc(clusters):
    refined_clusters = {}

    for cluster_id, kmers in clusters.items():
        high_gc_key = f"{cluster_id}_high_gc"
        low_gc_key = f"{cluster_id}_low_gc"

        refined_clusters[high_gc_key] = set()
        refined_clusters[low_gc_key] = set()

        for kmer in kmers:
            gc_content = calculate_gc_content(kmer)
            if gc_content >= 50:
                refined_clusters[high_gc_key].add(kmer)
            else:
                refined_clusters[low_gc_key].add(kmer)
    
    return refined_clusters

# Step 6: Leverage Paired-End Reads
def adjust_clusters_with_paired_end(clusters, paired_end_reads):
    for source, target in paired_end_reads:
        for cluster_id, kmers in clusters.items():
            if source in kmers:
                clusters[cluster_id].add(target)
                break
    return clusters

# Step 7: Handle Ambiguous Nodes
def resolve_ambiguous_nodes(clusters):
    all_kmers = set().union(*clusters.values())
    ambiguous_nodes = {kmer for kmer in all_kmers if sum(kmer in cluster for cluster in clusters.values()) > 1}
    for kmer in ambiguous_nodes:
        for cluster_id in clusters:
            if kmer in clusters[cluster_id]:
                clusters[cluster_id].remove(kmer)
    return clusters, ambiguous_nodes

# Step 8: Extract Sub-Graphs
def extract_subgraphs(clusters, graph):
    subgraphs = {}
    for cluster_id, kmers in clusters.items():
        subgraph_edges = {k: v for k, v in graph.items() if k in kmers and any(n in kmers for n in v)}
        subgraphs[cluster_id] = subgraph_edges
    return subgraphs

# Step 9: Output Sub-Graphs to File
def output_subgraphs(subgraphs, output_file):
    with open(output_file, "w") as f:
        for cluster_id, edges in subgraphs.items():
            f.write(f"Sub-Graph {cluster_id}:\n")
            for node, neighbors in edges.items():
                f.write(f"{node} -> {', '.join(neighbors)}\n")