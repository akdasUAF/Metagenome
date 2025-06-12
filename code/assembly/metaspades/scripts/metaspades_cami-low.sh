#!/bin/env bash
benchmark_script="code/benchmarking/benchmark.bash"
path_metaspades="code/assembly/metaspades/run_metaspades.sh"
raw_reads_dir="data/raw/cami-low/"
path_output="data/metaspades/cami-low/"
path_log="data/metaspades/logs/"
dataset="cami-low"
task="metaspades"

mkdir -p "${path_log}"
command="$path_metaspades \"$raw_reads_dir\" \"$path_output\" \"$path_log\""

echo "Command to pass to benchmark.bash: ${command}"
echo "Dataset: ${dataset}"
echo "Task: ${task}"

# Execute the benchmark script with the constructed command
bash "$benchmark_script" "$command" "$dataset" "$task"