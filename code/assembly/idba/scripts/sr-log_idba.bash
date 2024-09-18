#!/bin/env bash
benchmark_script="code/benchmarking/benchmark.bash"
path_idba="code/assembly/idba/run_idba.sh"
combined_in="data/process/sr-log/trimmed/sr-log_trimmed_combined.fastq"
path_output="data/sr-log/idba/"
path_log="data/sr-log/log/idba/"

## Benchmarking
dataset="sr-log"
task="idba"

## IDBA-UD only

mkdir -p ${path_output}
mkdir -p ${path_log}
log_file="${path_log}/log_asm_${task}_${dataset}.log"

# Construct the command to be executed
command="$path_idba $combined_in $path_output $path_log"

# Execute the benchmark script with the constructed command
bash $benchmark_script "$command" $dataset $task