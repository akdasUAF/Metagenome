#!/bin/env bash
benchmark_script="code/benchmarking/benchmark.bash"
path_metaspades="code/assembly/metaspades/run_metaspades.sh"
input_fastq_dir="data/raw/sr-ms/"
path_output="data/metaspades/sr-ms/"
path_log="data/metaspades/logs/sr-ms/"
dataset="sr-ms"
task="metaspades"

# Ensure the log directory exists
mkdir -p "${path_log}"

# This line should clear the *specific assembly output directory* before running
rm -rf "$path_output" # This is fine if path_output is the specific directory

# Construct the command string to be executed by benchmark.bash
command="$path_metaspades \"$input_fastq_dir\" \"$path_output\" \"$path_log\""

echo "Command to pass to benchmark.bash: ${command}"
echo "Dataset: ${dataset}"
echo "Task: ${task}"

# Execute the benchmark script with the constructed command
bash "$benchmark_script" "$command" "$dataset" "$task"