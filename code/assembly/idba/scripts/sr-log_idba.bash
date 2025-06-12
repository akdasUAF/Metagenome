#!/bin/env bash
benchmark_script="code/benchmarking/benchmark.bash"
path_idba="code/assembly/idba/run_idba.sh"
path_raw="data/raw/sr-log/sr-log_raw_combined_paired.fasta"
path_output="data/idba/sr-log/"
path_log="data/idba/logs/"

## Benchmarking
dataset="sr-even"
task="idba"

mkdir -p ${path_output}
mkdir -p ${path_log}
log_file="${path_log}/log_asm_${task}_${dataset}.log"

# Construct the command to be executed
command="$path_idba $path_raw $path_output $path_log"

# Execute the benchmark script with the constructed command
bash $benchmark_script "$command" $dataset $task