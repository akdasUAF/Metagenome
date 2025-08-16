import argparse
from decompose_graph import *
from contig_formation import *
import os
import time
from datetime import datetime, timedelta
from collections import defaultdict
import dask
from dask import delayed, compute
import sys
sys.path.insert(0, "/home/gauri/Metagenomics/Metagenome/Gauri/metagenomics_main")
from graph_utils import annotate_coverage_cython, refine_clusters_with_gc_cython


class TimingLogger:
    """Class to handle timing and logging of pipeline steps."""
    
    def __init__(self):
        self.step_times = {}
        self.step_start_time = None
        self.total_start_time = None
        
    def start_total_timing(self):
        """Start timing the entire process."""
        self.total_start_time = time.time()
        
    def start_step(self, step_name):
        """Start timing a specific step."""
        self.step_start_time = time.time()
        print(f"Starting: {step_name}...")
        
    def end_step(self, step_name):
        """End timing a specific step and log the duration."""
        if self.step_start_time is None:
            print(f"Warning: No start time recorded for {step_name}")
            return 0
            
        duration = time.time() - self.step_start_time
        self.step_times[step_name] = duration
        print(f"Completed: {step_name}")
        return duration
        
    def get_total_time(self):
        """Get total execution time."""
        if self.total_start_time is None:
            return 0
        return time.time() - self.total_start_time
        
    @staticmethod
    def format_time(seconds):
        """Format time in human-readable format."""
        if seconds < 60:
            return f"{seconds:.2f} seconds"
        elif seconds < 3600:
            minutes = int(seconds // 60)
            secs = seconds % 60
            return f"{minutes}m {secs:.2f}s"
        else:
            hours = int(seconds // 3600)
            minutes = int((seconds % 3600) // 60)
            secs = seconds % 60
            return f"{hours}h {minutes}m {secs:.2f}s"

def calculate_assembly_stats(contigs):
    """
    Calculate comprehensive assembly statistics for a list of contigs.
    Returns a dictionary with N50, N90, L50, L90, total/mean/median/min/max lengths, and contig count.
    """
    if not contigs:
        return {
            'n50': 0,
            'total_length': 0,
            'num_contigs': 0,
            'mean_length': 0,
            'median_length': 0,
            'min_length': 0,
            'max_length': 0,
            'n90': 0,
            'l50': 0,
            'l90': 0
        }
    
    contig_lengths = sorted([len(contig) for contig in contigs], reverse=True)
    total_length = sum(contig_lengths)
    num_contigs = len(contig_lengths)
    
    # Calculate N50 and L50
    cumulative_length = 0
    n50_value = 0
    l50_count = 0
    
    for i, length in enumerate(contig_lengths):
        cumulative_length += length
        if cumulative_length >= total_length / 2:
            n50_value = length
            l50_count = i + 1
            break
    
    # Calculate N90 and L90
    cumulative_length = 0
    n90_value = 0
    l90_count = 0
    
    for i, length in enumerate(contig_lengths):
        cumulative_length += length
        if cumulative_length >= total_length * 0.9:
            n90_value = length
            l90_count = i + 1
            break
    
    # Calculate median
    median_length = contig_lengths[num_contigs // 2] if num_contigs > 0 else 0
    
    return {
        'n50': n50_value,
        'n90': n90_value,
        'l50': l50_count,
        'l90': l90_count,
        'total_length': total_length,
        'num_contigs': num_contigs,
        'mean_length': total_length / num_contigs if num_contigs > 0 else 0,
        'median_length': median_length,
        'min_length': min(contig_lengths) if contig_lengths else 0,
        'max_length': max(contig_lengths) if contig_lengths else 0
    }

def analyze_contigs_from_dict(contigs_by_subgraph):
    """
    Analyze contigs directly from the dictionary returned by generate_contigs().
    Prints and returns statistics for each cluster and overall.
    """
    results = {}
    all_contigs = []
    
    for cluster_id, contigs in contigs_by_subgraph.items():
        if contigs:
            stats = calculate_assembly_stats(contigs)
            results[cluster_id] = stats
            all_contigs.extend(contigs)
            
            print(f"\nCluster {cluster_id} Statistics:")
            print(f"  N50: {stats['n50']} bp")
            print(f"  Total Length: {stats['total_length']} bp")
            print(f"  Number of Contigs: {stats['num_contigs']}")
            print(f"  Mean Length: {stats['mean_length']:.1f} bp")
            print(f"  Max Length: {stats['max_length']} bp")
            print(f"  L50: {stats['l50']} contigs")
    
    # Calculate overall statistics
    if all_contigs:
        overall_stats = calculate_assembly_stats(all_contigs)
        results['overall'] = overall_stats
        
        print(f"\nOverall Assembly Statistics:")
        print(f"  N50: {overall_stats['n50']} bp")
        print(f"  N90: {overall_stats['n90']} bp")
        print(f"  Total Length: {overall_stats['total_length']} bp")
        print(f"  Number of Contigs: {overall_stats['num_contigs']}")
        print(f"  Mean Length: {overall_stats['mean_length']:.1f} bp")
        print(f"  Median Length: {overall_stats['median_length']} bp")
        print(f"  Max Length: {overall_stats['max_length']} bp")
        print(f"  Min Length: {overall_stats['min_length']} bp")
        print(f"  L50: {overall_stats['l50']} contigs")
        print(f"  L90: {overall_stats['l90']} contigs")
    
    return results

def write_stats_to_file(results, timing_logger, output_file="assembly_stats.txt"):
    """
    Write assembly statistics and timing information to a file.
    Includes step-by-step timing, performance metrics, and summary.
    """
    with open(output_file, 'w') as f:
        # Header with timestamp
        f.write("Assembly Statistics and Performance Report\n")
        f.write("=" * 60 + "\n")
        f.write(f"Generated on: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
        f.write("=" * 60 + "\n\n")
        
        # Execution timing section
        f.write("EXECUTION TIMING\n")
        f.write("-" * 30 + "\n")
        f.write(f"Total Pipeline Execution Time: {timing_logger.format_time(timing_logger.get_total_time())}\n\n")
        
        f.write("Step-by-Step Timing:\n")
        total_step_time = 0
        for step_name, duration in timing_logger.step_times.items():
            f.write(f"  {step_name}: {timing_logger.format_time(duration)}\n")
            total_step_time += duration
        
        f.write(f"\nSum of individual steps: {timing_logger.format_time(total_step_time)}\n")
        overhead = timing_logger.get_total_time() - total_step_time
        f.write(f"Pipeline overhead: {timing_logger.format_time(overhead)}\n\n")
        
        # Performance metrics
        f.write("PERFORMANCE METRICS\n")
        f.write("-" * 30 + "\n")
        if 'overall' in results:
            total_bp = results['overall']['total_length']
            total_time = timing_logger.get_total_time()
            if total_time > 0:
                f.write(f"Assembly rate: {total_bp/total_time:.0f} bp/second\n")
                f.write(f"Assembly rate: {(total_bp/total_time)/1000:.2f} kbp/second\n")
        f.write("\n")
        
        # Assembly statistics section
        f.write("ASSEMBLY STATISTICS\n")
        f.write("-" * 30 + "\n\n")
        
        for cluster_id, stats in results.items():
            f.write(f"Cluster: {cluster_id}\n")
            f.write(f"  N50: {stats['n50']} bp\n")
            f.write(f"  N90: {stats['n90']} bp\n")
            f.write(f"  Total Length: {stats['total_length']} bp\n")
            f.write(f"  Number of Contigs: {stats['num_contigs']}\n")
            f.write(f"  Mean Length: {stats['mean_length']:.1f} bp\n")
            f.write(f"  Median Length: {stats['median_length']} bp\n")
            f.write(f"  Max Length: {stats['max_length']} bp\n")
            f.write(f"  Min Length: {stats['min_length']} bp\n")
            f.write(f"  L50: {stats['l50']} contigs\n")
            f.write(f"  L90: {stats['l90']} contigs\n")
            f.write("\n")
        
        # Summary section
        f.write("PIPELINE SUMMARY\n")
        f.write("-" * 30 + "\n")
        f.write(f"Pipeline completed successfully in {timing_logger.format_time(timing_logger.get_total_time())}\n")
        if 'overall' in results:
            f.write(f"Total contigs generated: {results['overall']['num_contigs']}\n")
            f.write(f"Total assembly length: {results['overall']['total_length']} bp\n")
            f.write(f"Assembly N50: {results['overall']['n50']} bp\n")
    
    print(f"Comprehensive statistics and timing written to {output_file}")

def write_contigs_to_files(contigs_by_subgraph, output_dir="output"):
    """
    Write contigs for each cluster to separate files, and all contigs to a combined FASTA.
    Also writes a summary file with cluster info.
    """
    os.makedirs(output_dir, exist_ok=True)
    summary_file = os.path.join(output_dir, "summary.txt")
    final_contigs_fasta = os.path.join(output_dir, "final.contigs.fasta")

    all_contigs = []  # Collect all contigs across clusters

    with open(summary_file, "w") as summary:
        for cluster_id, contigs in contigs_by_subgraph.items():
            cluster_file = os.path.join(output_dir, f"{cluster_id}_contigs.txt")
            
            with open(cluster_file, "w") as f:
                f.write("\n".join(contigs))
            
            # Add to all-contigs list (with cluster info for IDs)
            for i, seq in enumerate(contigs, 1):
                all_contigs.append((f"{cluster_id}_contig{i}", seq))
            
            # Log summary for each cluster
            summary.write(
                f"Cluster: {cluster_id}\n"
                f"Contigs Count: {len(contigs)}\n"
                f"Output File: {cluster_file}\n\n"
            )

    # Write all contigs into one combined FASTA file
    with open(final_contigs_fasta, "w") as f:
        for header, seq in all_contigs:
            f.write(f">{header}\n{seq}\n")

    print(f"Final combined FASTA written to {final_contigs_fasta}")

def parse_args():
    """
    Parse command-line arguments for the pipeline.
    Returns an argparse.Namespace object with all parameters.
    """
    parser = argparse.ArgumentParser(description="Iterative Metagenome Assembly Pipeline")
    parser.add_argument(
        "-r", "--reads",
        required=True,
        help="Path to FASTQ file (paired-end or single-end)"
    )
    parser.add_argument(
        "-k", "--k-values",
        type=int,
        nargs="+",
        default=[19],
        help="List of k-mer values for progressive assembly (space separated)"
    )
    parser.add_argument(
        "-m", "--min-contig-len",
        type=int,
        default=200,
        help="Minimum contig length to keep"
    )
    parser.add_argument(
        "-n", "--num-rounds",
        type=int,
        default=1,
        help="Number of compression/assembly rounds per k-mer"
    )
    parser.add_argument(
        "-g", "--graph-cleanup-rounds",
        type=int,
        default=1,
        help="Number of graph cleanup rounds during contig generation"
    )
    parser.add_argument(
        "-o", "--output-dir",
        default="final_output",
        help="Directory to save final contigs"
    )
    return parser.parse_args()

def main_with_stats_and_timing(args):
    """
    Main pipeline function: runs all steps, logs timing, and writes outputs.
    """
    timer = TimingLogger()

    print("=" * 60)
    print("STARTING ITERATIVE METAGENOME ASSEMBLY PIPELINE")
    print("=" * 60)

    fastq_file = args.reads
    k_values = args.k_values
    num_rounds = args.num_rounds
    graph_cleanup_rounds = args.graph_cleanup_rounds
    min_contig_len = args.min_contig_len

    # Step 1: Extract paired-end reads
    timer.start_step("Extract paired-end reads")
    paired_end_reads = extract_paired_end_reads(fastq_file)
    timer.end_step("Extract paired-end reads")

    # Step 2: Parse raw reads
    timer.start_step("Parse reads")
    reads = parse_reads(fastq_file)
    timer.end_step("Parse reads")

    # Step 3: Initial error correction
    timer.start_step("Initial error correction")
    reads = error_substitution(reads, k_values[0], threshold=1.0)
    timer.end_step("Initial error correction")

    timer.start_total_timing()
    all_contigs = {}
    subgraphs = {}
    for k in k_values:
        print(f"\n--- Progressive Assembly with k={k} ---")
        chunk_size = 1000
        read_chunks = [reads[i:i + chunk_size] for i in range(0, len(reads), chunk_size)]


        for round_num in range(num_rounds):
            print(f"\n=== COMPRESSION ROUND {round_num + 1} ===")

            timer.start_step(f"k={k} R{round_num + 1}: Build graphs")
            graphs = compute(*[delayed(construct_de_bruijn_graph)(chunk, k) for chunk in read_chunks])
            graph = defaultdict(set)
            for g in graphs:
                for key, val in g.items():
                    graph[key].update(val)
            timer.end_step(f"k={k} R{round_num + 1}: Build graphs")

            timer.start_step(f"k={k} R{round_num + 1}: Coverage + Clustering")
            coverage_map = annotate_coverage_cython(reads, k)
            clusters = cluster_by_coverage(coverage_map, 2)
            clusters = refine_clusters_with_gc_cython(dict(clusters), k)
            scaffolding_mode = round_num > 0
            clusters = adjust_clusters_with_paired_end(clusters, paired_end_reads, relax=scaffolding_mode)
            clusters, _ = resolve_ambiguous_nodes(clusters)
            subgraphs = extract_subgraphs(clusters, graph, subgraphs)
            timer.end_step(f"k={k} R{round_num + 1}: Coverage + Clustering")

        timer.start_step(f"k={k}: Contig generation")
        contigs_by_subgraph = generate_contigs(subgraphs, cleanup_rounds=graph_cleanup_rounds)

        removed_count = 0
        for cluster_id, seqs in contigs_by_subgraph.items():
            filtered = [seq for seq in seqs if len(seq) >= min_contig_len]
            removed_count += len(seqs) - len(filtered)
            if filtered:
                all_contigs[cluster_id] = filtered
        print("Small contigs removed:", removed_count)
        timer.end_step(f"k={k}: Contig generation")

    print("\nPIPELINE COMPLETED")
    print(f"Total time: {timer.format_time(timer.get_total_time())}")

    stats_results = analyze_contigs_from_dict(all_contigs)
    write_stats_to_file(stats_results, timer, output_file=f"assembly_stats.txt")
    write_contigs_to_files(all_contigs, output_dir=args.output_dir)

    return stats_results, timer

if __name__ == "__main__":
    # Entry point: parse arguments and run the pipeline
    args = parse_args()
    results, timing_data = main_with_stats_and_timing(args)