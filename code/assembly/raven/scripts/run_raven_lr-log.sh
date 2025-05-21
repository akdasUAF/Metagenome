#!/bin/env bash
benchmark_script="code/benchmarking/benchmark.bash"
path_raven="code/assembly/raven/run_raven.sh"
raw_path="data/raw/lr-log/Zymo-GridION-LOG-BB-SN.fq"
output_directory="data/raven/lr-log/assembly_raven_lr-log.fasta"
log_dir="data/raven/logs/"
dataset="lr-log"
task="raven"

mkdir -p $(dirname "$output_directory")
mkdir -p ${log_dir}
log_file="${log_dir}/log_asm_${task}_${dataset}.log"

# Construct the command to be executed
command="$path_raven $raw_path $output_directory $log_file"

# Execute the benchmark script with the constructed command
bash $benchmark_script "$command" $dataset $task


