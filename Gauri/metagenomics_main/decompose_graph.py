from collections import defaultdict, deque
from itertools import islice
from Bio import SeqIO
import numpy as np
from sklearn.cluster import KMeans
import dask
from dask import delayed, compute
from scipy.spatial.distance import mahalanobis
from sklearn.preprocessing import normalize
from sklearn.mixture import GaussianMixture
import pandas as pd
from itertools import product
from scipy.stats import multivariate_normal

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
        for i in range(0, len(records) - 1, 2):  # Ensure we don’t go out of range
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


def get_canonical_4mers():
    bases = ['A', 'C', 'G', 'T']
    all_4mers = [''.join(p) for p in product(bases, repeat=4)]
    canonicals = set()
    for mer in all_4mers:
        rev_comp = mer[::-1].translate(str.maketrans("ACGT", "TGCA"))
        canonicals.add(min(mer, rev_comp))
    return sorted(list(canonicals))

CANONICAL_4MERS = get_canonical_4mers()

# Compute 4-mer frequency for a k-mer
def compute_tnf_vector(kmer):
    counts = defaultdict(int)
    for i in range(len(kmer) - 3):
        mer = kmer[i:i+4]
        rev_comp = mer[::-1].translate(str.maketrans("ACGT", "TGCA"))
        canonical = min(mer, rev_comp)
        counts[canonical] += 1
    total = sum(counts.values()) or 1
    return [counts[canon] / total for canon in CANONICAL_4MERS]

def compute_tnf_vectors(kmers):
    return np.array([compute_tnf_vector(kmer) for kmer in kmers])

def cluster_by_tnf(kmers, n_clusters, method="euclidean"):
    tnf_matrix = compute_tnf_vectors(kmers)

    if method == "mahalanobis":
        VI = np.linalg.inv(np.cov(tnf_matrix.T))
        dist_matrix = np.array([
            [mahalanobis(a, b, VI) for b in tnf_matrix]
            for a in tnf_matrix
        ])
        # Apply clustering (e.g., GMM on distance matrix)
        gmm = GaussianMixture(n_components=n_clusters, covariance_type='full', random_state=0)
        labels = gmm.fit_predict(dist_matrix)
    else:
        # Default to Euclidean clustering
        kmeans = KMeans(n_clusters=n_clusters, random_state=0)
        labels = kmeans.fit_predict(tnf_matrix)

    clusters = defaultdict(set)
    for kmer, label in zip(kmers, labels):
        clusters[label].add(kmer)
    return clusters


def extract_features_for_em(kmers, coverage_map):
    feature_matrix = []
    for kmer in kmers:
        tnf_vec = compute_tnf_vector(kmer)
        coverage = np.log1p(coverage_map.get(kmer, 1)) / 10  # log-scale normalize
        feature_matrix.append(tnf_vec + [coverage])
    return np.array(feature_matrix)

def em_binning(kmers, coverage_map, n_bins=2, max_iter=10, eps=1e-3):
    X = extract_features_for_em(kmers, coverage_map)

    # Step 1: Initialization via KMeans
    kmeans = KMeans(n_clusters=n_bins, random_state=0).fit(X)
    labels = kmeans.labels_
    mus = [X[labels == i].mean(axis=0) for i in range(n_bins)]
    covs = [np.cov(X[labels == i].T) + np.eye(X.shape[1]) * 1e-6 for i in range(n_bins)]
    pis = [np.mean(labels == i) for i in range(n_bins)]

    for iteration in range(max_iter):
        # E-step
        probs = np.zeros((X.shape[0], n_bins))
        for i in range(n_bins):
            rv = multivariate_normal(mean=mus[i], cov=covs[i], allow_singular=True)
            probs[:, i] = pis[i] * rv.pdf(X)

        probs = probs / probs.sum(axis=1, keepdims=True)  # normalize

        # M-step
        N_k = probs.sum(axis=0)
        for i in range(n_bins):
            mus[i] = np.sum(probs[:, i].reshape(-1, 1) * X, axis=0) / N_k[i]
            covs[i] = np.cov(X.T, aweights=probs[:, i]) + np.eye(X.shape[1]) * 1e-6
            pis[i] = N_k[i] / X.shape[0]

        # Optional convergence check (based on mu delta)
        if iteration > 0 and np.max(np.abs(prev_mus - np.array(mus))) < eps:
            break
        prev_mus = np.array(mus)

    # Final hard assignment
    bin_assignments = np.argmax(probs, axis=1)
    clusters = defaultdict(set)
    for kmer, bin_id in zip(kmers, bin_assignments):
        clusters[bin_id].add(kmer)

    return clusters

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
def adjust_clusters_with_paired_end(clusters, paired_end_reads, relax=False):
    for read1, read2 in paired_end_reads:
        for cluster_id, kmers in clusters.items():
            match = None
            if read1 in kmers:
                match = read2
            elif relax:
                # Relaxed condition: check prefix/suffix matches
                for kmer in kmers:
                    if read1[:10] in kmer or read1[-10:] in kmer:
                        match = read2
                        break
            if match:
                clusters[cluster_id].add(match)
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


def error_substitution(reads, k, threshold=1.0):
    corrected_reads = []
    global_kmer_coverage = annotate_coverage(reads, k)
    global_coverage_values = list(global_kmer_coverage.values())
    global_median = np.median(global_coverage_values)

    for read in reads:
        subregions = [read[i:i+k] for i in range(0, len(read) - k + 1, k)]
        coverage_list = [np.mean([global_kmer_coverage.get(kmer, 0) for kmer in generate_kmers(sub, k)]) for sub in subregions]
        mean_ = np.mean(coverage_list)
        median_ = np.median(coverage_list)
        std_ = np.std(coverage_list) if np.std(coverage_list) != 0 else 1
        skew = (mean_ - median_) / std_

        new_read = ""
        for i, sub in enumerate(subregions):
            local_kmer_cov = [global_kmer_coverage.get(kmer, 0) for kmer in generate_kmers(sub, k)]
            local_median = np.median(local_kmer_cov)
            if skew < threshold:  # True region
                new_read += sub
            else:
                # If the subregion is likely erroneous
                high_threshold = global_median * 1.5
                low_threshold = global_median * 0.5
                corrected_sub = ""
                for kmer in generate_kmers(sub, k):
                    cov = global_kmer_coverage.get(kmer, 0)
                    if (local_median >= global_median and cov >= high_threshold) or (cov >= low_threshold):
                        corrected_sub += kmer[0]
                    else:
                        corrected_sub += "N"
                new_read += corrected_sub
        corrected_reads.append(new_read)

    return corrected_reads
