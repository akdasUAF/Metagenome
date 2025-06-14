#!/bin/bash
benchmark_script="code/benchmarking/benchmark.bash"
path_megahit="code/assembly/megahit/run_megahit.sh"
raw_reads_dir="data/raw/sr-ms/"
path_output="data/megahit/sr-ms/"
path_log="data/megahit/logs/sr-ms/"
dataset="sr-ms"
task="megahit"

mkdir -p "${path_log}"
command="$path_megahit \"$raw_reads_dir\" \"$path_output\" \"$path_log\""

echo "Command to pass to benchmark.bash: ${command}"
echo "Dataset: ${dataset}"
echo "Task: ${task}"

# Execute the benchmark script with the constructed command
bash "$benchmark_script" "$command" "$dataset" "$task"
















