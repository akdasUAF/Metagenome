#!/bin/env bash
benchmark_script="code/benchmarking/benchmark.bash"
path_raven="code/assembly/raven/run_raven.sh"
raw_path="data/lr-ms/raw/lr-ms_raw.fastq"
path_output="data/lr-ms/raven/assembly_raven_lr-log.fasta"
log_dir="data/lr-ms/logs/"
dataset="lr-ms"
task="raven"

mkdir -p $(dirname "$path_output")
mkdir -p ${log_dir}
log_file="${log_dir}/log_asm_${task}_${dataset}.log"

# Construct the command to be executed
command="$path_raven $raw_path $path_output $log_file"

# Execute the benchmark script with the constructed command
bash $benchmark_script "$command" $dataset $task


