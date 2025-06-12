#!/bin/env bash

# Define paths and static parameters
benchmark_script="code/benchmarking/benchmark.bash" # Consider if this is still needed or how it integrates
path_abyss_core_script="code/assembly/abyss/abyss.sh" # Path to the core ABySS execution script
forward_reads="data/raw/sr-even/sr-even_1_trimmed.fastq"
reverse_reads="data/raw/sr-even/sr-even_2_trimmed.fastq"
base_output_dir="data/abyss/sr-even/" # Base directory for all k-mer specific outputs
base_log_dir="data/logs/sr-even/"     # Base directory for all k-mer specific logs
dataset="sr-even"
task="abyss"

# K-mer iteration parameters
start_kmer=31
# Decide between iterating 5 or 10 times. Let's make it flexible.
# If you want 5 iterations: end_kmer=start_kmer + (5-1)*step_kmer
# If you want 10 iterations: end_kmer=start_kmer + (10-1)*step_kmer
# Or simply set the desired max kmer directly:
max_kmer=111 # Maximum k-mer to try
step_kmer=10 # Increment by 10 (e.g., 31, 41, 51, ...) or 5 (e.g., 31, 36, 41, ...)

# Other ABySS parameters
bloom_filter_size="10G" # Bloom filter size, adjust as needed

# Create base output and log directories if they don't exist
mkdir -p "${base_output_dir}"
mkdir -p "${base_log_dir}"

echo "--- Starting iterative ABySS assembly for dataset: ${dataset} ---"
echo "  K-mer range: ${start_kmer} to ${max_kmer} with step ${step_kmer}"
echo "  Forward Reads: ${forward_reads}"
echo "  Reverse Reads: ${reverse_reads}"
echo "  Base Output Directory: ${base_output_dir}"
echo "  Base Log Directory: ${base_log_dir}"
echo "---------------------------------------------------------------"

# Loop through k-mer sizes
for ((k = ${start_kmer}; k <= ${max_kmer}; k += ${step_kmer})); do
    # Ensure k-mer is odd (ABySS prefers odd k-mers)
    if (( k % 2 == 0 )); then
        echo "Warning: k-mer $k is even. Skipping or adjusting to $k+1 if within max_kmer."
        k=$((k + 1))
        if (( k > ${max_kmer} )); then
            break # If incrementing makes it go past max_kmer, break
        fi
    fi

    echo "Running ABySS with k-mer: $k"

    # Define unique names/paths for this specific k-mer run
    # This name will be passed to abyss.sh and used for directory/file naming
    current_assembly_name="${task}_${dataset}_k${k}"
    current_log_file="${base_log_dir}/log_asm_${current_assembly_name}.log"

    # Construct the command to be executed by the benchmark script
    # The benchmark script (code/benchmarking/benchmark.bash) would then call path_abyss_core_script
    # with the appropriate arguments.
    # The `path_log` argument to path_abyss_core_script is currently unused there,
    # as SLURM handles logging.
    # However, if benchmark_script uses it for internal logging, keep it.
    command_for_benchmark="${path_abyss_core_script} ${forward_reads} ${reverse_reads} ${base_output_dir} ${current_assembly_name} ${k} ${bloom_filter_size}"

    # Execute the benchmark script with the constructed command
    # Output is already captured by SLURM's --output/-e.
    # If benchmark_script itself has internal logging, that's fine.
    echo "Executing: bash ${benchmark_script} \"${command_for_benchmark}\" ${dataset} ${task}"
    bash "${benchmark_script}" "${command_for_benchmark}" "${dataset}" "${task}"

    if [ $? -ne 0 ]; then
        echo "ERROR: ABySS assembly for k-mer $k failed. See logs for details."
        # Decide whether to exit or continue with next k-mer
        # exit 1
    fi
done

echo "--- All ABySS iterative assemblies completed. ---"
echo "Check '${base_output_dir}' for individual k-mer assembly directories."

# Optional: Add a step here to run QUAST/MetaQUAST on all generated contigs
# For example:
# echo "Running MetaQUAST on all assemblies..."
# abyss_contig_files=""
# for ((k = ${start_kmer}; k <= ${max_kmer}; k += ${step_kmer})); do
#     if (( k % 2 == 0 )); then k=$((k + 1)); fi # Adjust k if it became even from prev step
#     if (( k > ${max_kmer} )); then break; fi
#     abyss_contig_files+=" ${base_output_dir}/${task}_${dataset}_k${k}/${task}_${dataset}_k${k}-contigs.fa"
# done
#
# # Example: Using metaQUAST (assuming it's in your PATH or you provide full path)
# # You might need to install metaquast first if you don't have it
# mkdir -p "${base_output_dir}/quast_reports"
# metaquast.py ${abyss_contig_files} -o "${base_output_dir}/quast_reports/all_abyss_kmer_report" \
#     --output-format html --labels $(echo ${abyss_contig_files} | sed 's/\s/,/g' | sed 's/.*k//g' | sed 's/\/.*/ /g' | tr -d ' ')
# echo "MetaQUAST report generated in ${base_output_dir}/quast_reports/"