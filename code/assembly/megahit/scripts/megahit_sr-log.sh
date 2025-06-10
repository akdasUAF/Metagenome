#!/bin/env bash
benchmark_script="code/benchmarking/benchmark.bash"
path_megahit="code/assembly/megahit/run_megahit.sh"
raw_reads_dir="data/raw/sr-log/"
path_output="data/sr-log/megahit/"
path_log="data/sr-log/log/"

dataset="sr-log"
task="megahit"

mkdir -p "${path_log}" # Make sure this log directory exists


command="$path_megahit \"$raw_reads_dir\" \"$path_output\" \"$path_log\""


echo "Command to pass to benchmark.bash: ${command}"
echo "Dataset: ${dataset}"
echo "Task: ${task}"

# Execute the benchmark script with the constructed command
bash "$benchmark_script" "$command" "$dataset" "$task"