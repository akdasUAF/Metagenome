from decompose_graph import *
from contig_formation import *

# Main workflow
def main():
    fastq_file = "16S_WT_day3_11_SRR2628505_1.fastq"  # Replace with your FASTQ file path
    k = 21
    n_species = 2
    paired_end_reads = extract_paired_end_reads(fastq_file)
    reads = parse_reads(fastq_file)

    # Split reads into chunks for parallel processing
    chunk_size = len(reads) // 4  # Adjust chunk size as needed
    read_chunks = [reads[i:i + chunk_size] for i in range(0, len(reads), chunk_size)]

    # Use Dask delayed for parallel processing
    graphs_delayed = [delayed(construct_de_bruijn_graph)(chunk, k) for chunk in read_chunks]
    graphs = compute(*graphs_delayed)

    # Combine results into a single graph
    graph = defaultdict(set)
    for g in graphs:
        for key, value in g.items():
            graph[key].update(value)

    # Remaining workflow
    coverage_map = annotate_coverage(reads, k)
    clusters = cluster_by_coverage(coverage_map, n_species)
    clusters = refine_clusters_with_gc(clusters)
    clusters = adjust_clusters_with_paired_end(clusters, paired_end_reads)
    clusters, ambiguous_nodes = resolve_ambiguous_nodes(clusters)
    subgraphs = extract_subgraphs(clusters, graph)
    output_subgraphs(subgraphs, "subgraphs_output.txt")

    # TODO: Multiple rounds of compression
    contigs_by_subgraph = generate_contigs(subgraphs)
    write_contigs_to_files(contigs_by_subgraph)

if __name__ == "__main__":
    main()
