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
command="unicycler -1 data/process/sr-bmock/trimmed/sr-bmock_trimmed_SRR8073716_1.fastq.gz -2 data/process/sr-bmock/trimmed/sr-bmock_trimmed_SRR8073716_2.fastq.gz -o data/MAG/unicycler/sr-bmock/"


# Execute the benchmark script with the constructed command
"$benchmark_script" "$command" -d "$dataset" -t "$task"

