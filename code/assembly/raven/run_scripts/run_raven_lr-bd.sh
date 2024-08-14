#!/bin/env bash
benchmark_script="code/benchmarking/benchmark.bash"
path_raven="tools/assemblers/raven/build/bin/raven"
raw_dir="data/process/lr-bd/trimmed/"
MAG_output="data/MAG/metaspades/sr-bmock/"
path_log="data/logs/lr-bd/metaspades/"
dataset="lr-bd"
task="raven"


mkdir -p ${path_log}
log_file="${path_log}/log_asm_${task}_${dataset}.log"


# Construct the command to be executed
command="code/assembly/raven/run_raven.sh"



# Execute the benchmark script with the constructed command
"$benchmark_script" "$command" -d "$dataset" -t "$task"
