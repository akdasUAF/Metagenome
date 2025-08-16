from collections import defaultdict
from Bio import SeqIO
import numpy as np
from sklearn.cluster import KMeans
import dask.bag as db
import dask.array as da

# Step 1: Parse Reads from FASTQ file
def parse_reads(fastq_file):
    # Returns a list of read sequences from a FASTQ file
    return [str(record.seq) for record in SeqIO.parse(fastq_file, "fastq")]

# Step 2: Generate all k-mers from a read
def generate_kmers(read, k):
    # Returns a list of all k-mers in the given read
    return [read[i:i+k] for i in range(len(read) - k + 1)]

# Step 2: Construct a de Bruijn graph from reads
def construct_de_bruijn_graph(reads, k):
    # Builds a de Bruijn graph as a dict: k-mer -> set of next k-mers
    graph = defaultdict(set)
    for read in reads:
        kmers = generate_kmers(read, k)
        for i in range(len(kmers) - 1):
            graph[kmers[i]].add(kmers[i + 1])
    return graph

# Step 2: Extract paired-end reads from FASTQ file
def extract_paired_end_reads(fastq_file):
    # Returns a list of (read1, read2) tuples for paired-end reads
    paired_reads = []
    with open(fastq_file, "r") as f:
        records = list(SeqIO.parse(f, "fastq"))
        for i in range(0, len(records) - 1, 2):  # Ensure we don’t go out of range
            read1 = str(records[i].seq)
            read2 = str(records[i + 1].seq)
            paired_reads.append((read1, read2))
    return paired_reads

# Step 3: Annotate each k-mer node with its coverage (occurrence count)
def annotate_coverage(reads, k):
    # Returns a dict: k-mer -> coverage count
    coverage_map = defaultdict(int)
    for read in reads:
        kmers = generate_kmers(read, k)
        for kmer in kmers:
            coverage_map[kmer] += 1
    return coverage_map

# Step 4: Cluster k-mers by coverage using KMeans
def cluster_by_coverage(coverage_map, n_clusters):
    # Groups k-mers into clusters based on their coverage values
    kmers = list(coverage_map.keys())
    coverage_values = da.from_array(list(coverage_map.values()), chunks=10000).reshape(-1, 1)

    kmeans = KMeans(n_clusters=n_clusters, random_state=0)
    kmeans.fit(coverage_values)
    labels = kmeans.predict(coverage_values)

    clusters = defaultdict(set)
    for kmer, label in zip(kmers, labels):
        clusters[label].add(kmer)
    return clusters

# Step 5: Calculate GC content of a k-mer
def calculate_gc_content(kmer_arr):
    gc_count = 0
    for base in kmer_arr:
        if base == 1 or base == 2:  # assuming mapping
            gc_count += 1
    return (gc_count / len(kmer_arr)) * 100

# Step 5: Refine clusters by splitting on GC content threshold
def refine_clusters_with_gc(clusters, k, threshold=50):
    # Splits each cluster into high-GC and low-GC subclusters
    refined_clusters = {}
    for cluster_id, kmers in clusters.items():
        high_gc = {kmer for kmer in kmers if calculate_gc_content(kmer) >= threshold}
        low_gc = kmers - high_gc
        if high_gc:
            refined_clusters[f"{cluster_id}_high_gc_{k}"] = high_gc
        if low_gc:
            refined_clusters[f"{cluster_id}_low_gc_{k}"] = low_gc
    return refined_clusters

# Step 6: Adjust clusters using paired-end read information
def adjust_clusters_with_paired_end(clusters, paired_end_reads, relax=False, min_links=3):
    # Merges clusters that are strongly linked by paired-end reads
    kmer_to_cluster = {}
    for cid, kmers in clusters.items():
        for k in kmers:
            kmer_to_cluster[k] = cid

    # Count cluster links via paired ends
    cluster_links = defaultdict(lambda: defaultdict(int))
    for read1, read2 in paired_end_reads:
        c1, c2 = None, None
        for r, assign in [(read1, 'c1'), (read2, 'c2')]:
            if r in kmer_to_cluster:
                if assign == 'c1':
                    c1 = kmer_to_cluster[r]
                else:
                    c2 = kmer_to_cluster[r]
            elif relax:
                # Try partial match if relax is True
                for kmer, cid in kmer_to_cluster.items():
                    if r[:10] in kmer or r[-10:] in kmer:
                        if assign == 'c1':
                            c1 = cid
                        else:
                            c2 = cid
                        break
        if c1 and c2 and c1 != c2:
            cluster_links[c1][c2] += 1
            cluster_links[c2][c1] += 1

    # Merge clusters with strong links
    for c1 in list(clusters.keys()):
        for c2, link_count in cluster_links[c1].items():
            if link_count >= min_links:
                clusters[c1].update(clusters[c2])
                clusters[c2].clear()

    return clusters

# Step 7: Resolve ambiguous k-mers that belong to multiple clusters
def resolve_ambiguous_nodes(clusters, kmer_coverage=None):
    # Ensures each k-mer is assigned to only one cluster, using coverage if available
    kmer_to_clusters = {}
    for cid, kmers in clusters.items():
        for k in kmers:
            kmer_to_clusters.setdefault(k, []).append(cid)

    ambiguous_nodes = {k: cids for k, cids in kmer_to_clusters.items() if len(cids) > 1}

    for kmer, cids in ambiguous_nodes.items():
        if kmer_coverage:
            # Assign to cluster with highest coverage
            best_cid = max(cids, key=lambda cid: kmer_coverage.get(kmer, 0))
        else:
            # Default: keep in first cluster
            best_cid = cids[0]
        for cid in cids:
            if cid != best_cid:
                clusters[cid].remove(kmer)

    return clusters, set(ambiguous_nodes.keys())

# Step 8: Extract subgraphs for each cluster from the main graph
def extract_subgraphs(clusters, graph, subgraphs):
    # Returns a dict: cluster_id -> subgraph (edges only between cluster's k-mers)
    for cluster_id, kmers in clusters.items():
        subgraph_edges = {k: v for k, v in graph.items() if k in kmers and any(n in kmers for n in v)}
        subgraphs[cluster_id] = subgraph_edges
    return subgraphs

# Error correction: substitute low-coverage regions with 'N'
def error_substitution(reads, k, threshold=1.0, npartitions=8):
    # Performs error correction on reads using k-mer coverage statistics
    # Step 1: Precompute global k-mer coverage once (serial)
    global_kmer_coverage = annotate_coverage(reads, k)
    global_coverage_values = list(global_kmer_coverage.values())
    global_median = np.median(global_coverage_values)

    def process_read(read):
        # Divide read into subregions and compute coverage stats
        subregions = [read[i:i+k] for i in range(0, len(read) - k + 1, k)]
        coverage_list = [
            np.mean([global_kmer_coverage.get(kmer, 0) for kmer in generate_kmers(sub, k)])
            for sub in subregions
        ]
        mean_ = np.mean(coverage_list)
        median_ = np.median(coverage_list)
        std_ = np.std(coverage_list) if np.std(coverage_list) != 0 else 1
        skew = (mean_ - median_) / std_

        new_read = ""
        for sub in subregions:
            local_kmer_cov = [global_kmer_coverage.get(kmer, 0) for kmer in generate_kmers(sub, k)]
            local_median = np.median(local_kmer_cov)

            if skew < threshold:  # True region, keep as is
                new_read += sub
            else:
                # Substitute low-coverage regions with 'N'
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

        return new_read

    # Step 2: Use Dask Bag to process reads in parallel
    bag = db.from_sequence(reads, npartitions=npartitions)
    corrected_reads = bag.map(process_read).compute()

    return corrected_reads