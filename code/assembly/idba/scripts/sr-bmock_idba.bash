#!/bin/env bash
benchmark_script="code/benchmarking/benchmark.bash"
path_idba="code/assembly/idba/run_idba.sh"
forward_in="data/process/sr-bmock/trimmed/sr-bmock_trimmed_1.fastq"
reverse_in="data/process/sr-bmock/trimmed/sr-bmock_trimmed_2.fastq"
path_output="data/MAG/sr-bmock/idba/"
path_log="data/analysis/sr-bmock/idba/"

## Benchmarking
dataset="sr-bmock"
task="idba"

## IDBA-UD only
combined_out="data/process/sr-bmock/trimmed/sr-bmock_trimmed_combined.fastq"

mkdir -p ${path_output}
mkdir -p ${path_log}
log_file="${path_log}/log_asm_${task}_${dataset}.log"

# Construct the command to be executed
command="$path_idba $forward_in $reverse_in $combined_out $path_output $path_log"

# Execute the benchmark script with the constructed command
bash $benchmark_script "$command" $dataset $task