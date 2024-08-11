#!/bin/bash
benchmark_script="code/benchmarking/benchmark.bash"
path_unicycler="code/assembly/unicycler/scripts/run_unicycler_sr-bmock.sh"
raw_dir="data/process/sr-bmock/trimmed/"
MAG_output="data/MAG/unicycler/sr-bmock/"
path_log="data/logs/sr-bmock/unicycler/"
dataset="sr-bmock"
task="unicycler"


mkdir -p ${path_log}
log_file="${path_log}/log_asm_${task}_${dataset}.log"

#  $MAG_output $log_file
# Construct the command to be executed
command="conda run -n asm_unicycler $path_unicycler"


# Execute the benchmark script with the constructed command
"$benchmark_script" "$command" -d "$dataset" -t "$task"

