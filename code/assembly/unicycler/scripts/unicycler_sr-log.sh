#!/bin/env bash
benchmark_script="code/benchmarking/benchmark.bash"
path_unicycler="code/assembly/unicycler/run_unicycler.sh"
input_fastq_dir="data/raw/sr-log/"
path_output="data/unicycler/sr-log/"
path_log="data/unicycler/logs/sr-log/"
dataset="sr-log"
task="unicycler"

rm -rf "$path_output"
mkdir -p "${path_log}"

# Construct the command string to be executed by benchmark.bash
# Now, run_unicycler.sh expects the input directory, output directory, and log directory
command="$path_unicycler \"$input_fastq_dir\" \"$path_output\" \"$path_log\""

echo "Command to pass to benchmark.bash: ${command}"
echo "Dataset: ${dataset}"
echo "Task: ${task}"

# Execute the benchmark script with the constructed command
bash "$benchmark_script" "$command" "$dataset" "$task"