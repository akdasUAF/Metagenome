#!/bin/env bash
benchmark_script="code/benchmarking/benchmark.bash"
path_metaspades="code/assembly/metaspades/run_metaspades.sh"
input_fastq_dir="data/raw/sr-even/"
path_output="data/metaspades/sr-even/"
path_log="data/metaspades/logs/sr-even/"
dataset="sr-even"
task="metaspades"

rm -rf "$path_output" 
mkdir -p "${path_log}"

# Construct the command string to be executed by benchmark.bash
command="$path_metaspades \"$input_fastq_dir\" \"$path_output\" \"$path_log\""

echo "Command to pass to benchmark.bash: ${command}"
echo "Dataset: ${dataset}"
echo "Task: ${task}"

# Execute the benchmark script with the constructed command
bash "$benchmark_script" "$command" "$dataset" "$task"



