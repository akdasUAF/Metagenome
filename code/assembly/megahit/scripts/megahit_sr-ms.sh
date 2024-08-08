#!/bin/bash
benchmark_script="code/benchmarking/benchmark.bash"
path_megahit="code/processing/megahit/run_megahit.bash"
raw_dir="data/raw/sr-ms/"
MAG_output="data/process/sr-ms/"
path_log="data/logs/sr-ms/megahit/"
dataset="sr-ms"
task="megahit"


mkdir -p ${path_log}
log_file="${path_log}/log_asm_${task}_${dataset}.log"


# Construct the command to be executed
command="$path_megahit $raw_dir $MAG_output $log_file"

# Execute the benchmark script with the constructed command
"$benchmark_script" "$command" -d "$dataset" -t "$task"

