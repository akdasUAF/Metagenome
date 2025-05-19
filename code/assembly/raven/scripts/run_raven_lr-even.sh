#!/bin/env bash
benchmark_script="code/benchmarking/benchmark.bash"
path_raven="code/assembly/raven/run_raven.sh"
raw_path="data/lr-bd/raw/lr-bd_raw.fastq"
MAG_output="data/MAG/lr-bd/raven/assembly_raven_lr-bd.fasta"
log_dir="data/MAG/lr-bd/"
dataset="lr-bd"
task="raven"

mkdir -p $(dirname "$MAG_output")
mkdir -p ${log_dir}
log_file="${log_dir}/log_asm_${task}_${dataset}.log"

# Construct the command to be executed
command="$path_raven $raw_path $MAG_output $log_file"

# Execute the benchmark script with the constructed command
bash $benchmark_script "$command" $dataset $task


