#!/bin/env bash
benchmark_script="code/benchmarking/benchmark.bash"
path_raven="code/assembly/raven/run_raven.sh"
raw_path="data/lr-fpes/raw/lr-fpes_raw.fastq"
output_path="data/lr-fpes/raven/assembly_raven_lr-fpes.fasta"
log_dir="data/MAG/lr-fpes/"
dataset="lr-fpes"
task="raven"

mkdir -p $(dirname "$output_path")
mkdir -p ${log_dir}
log_file="${log_dir}/log_asm_${task}_${dataset}.log"

# Construct the command to be executed
command="$path_raven $raw_path $output_path $log_file"

# Execute the benchmark script with the constructed command
bash $benchmark_script "$command" $dataset $task


