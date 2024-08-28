#!/bin/env bash
benchmark_script="code/benchmarking/benchmark.bash"
path_unicycler="code/assembly/unicycler/run_unicycler.sh"
forward_in="data/sr-log/trimmed/sr-log_trimmed_1.fastq"
reverse_in="data/sr-log/trimmed/sr-log_trimmed_2.fastq"
path_log="data/sr-log/log/"
path_output="data/sr-log/unicycler/"
dataset="sr-log"
task="unicycler"


mkdir -p ${path_log}
log_file="${path_log}/log_asm_${task}_${dataset}.log"

# Construct the command to be executed
command="$path_unicycler $forward_in $reverse_in $path_output $log_file"

# Execute the benchmark script with the constructed command
bash $benchmark_script "$command" $dataset $task





