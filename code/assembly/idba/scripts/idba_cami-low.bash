#!/bin/env bash
benchmark_script="code/benchmarking/benchmark.bash"
path_idba="code/assembly/idba/run_idba.sh"
raw_reads_dir="data/raw/cami-low/"
path_output="data/idbar/cami-low/"
path_log="data/idba/logs/"

## Benchmarking
dataset="cami-low"
task="idba"

mkdir -p "${path_log}"
command="$idba \"$raw_reads_dir\" \"$path_output\" \"$path_log\""

echo "Command to pass to benchmark.bash: ${command}"
echo "Dataset: ${dataset}"
echo "Task: ${task}"

# Execute the benchmark script with the constructed command
bash "$benchmark_script" "$command" "$dataset" "$task"