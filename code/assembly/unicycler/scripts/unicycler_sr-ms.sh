#!/bin/env bash
benchmark_script="code/benchmarking/benchmark.bash"
path_unicycler="code/assembly/unicycler/run_unicycler.sh"
forward_in="data/sr-ms/trimmed/sr-ms_trimmed_1.fastq"
reverse_in="data/sr-ms/trimmed/sr-ms_trimmed_2.fastq"
path_log="data/sr-ms/log/"
path_output="data/sr-ms/unicycler/"
dataset="sr-ms"
task="unicycler"


mkdir -p ${path_log}
log_file="${path_log}/log_asm_${task}_${dataset}.log"

# Construct the command to be executed
command="$path_unicycler $forward_in $reverse_in $path_output $log_file"

# Execute the benchmark script with the constructed command
bash $benchmark_script "$command" $dataset $task


forward_in=$1
reverse_in=$2
path_output=$3
path_log=$4






