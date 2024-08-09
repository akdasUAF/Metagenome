#!/bin/bash
benchmark_script="code/benchmarking/benchmark.bash"
path_metaspades="code/assembly/metaspades/run_metaspades.sh"
raw_dir="data/process/sr-ms/trimmed/"
MAG_output="data/MAG/sr-ms/"
path_log="data/logs/sr-ms/metaspades/"
dataset="sr-ms"
task="metaspades"


mkdir -p ${path_log}
log_file="${path_log}/log_asm_${task}_${dataset}.log"


# Construct the command to be executed
command="$path_metaspades $raw_dir $MAG_output $log_file"

# Execute the benchmark script with the constructed command
"$benchmark_script" "$command" -d "$dataset" -t "$task"

