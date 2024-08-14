#!/bin/env bash
benchmark_script="code/benchmarking/benchmark.bash"
path_raven="code/assembly/raven/run_raven.sh"
raw_path="data/raw/lr-ms/SRR27145287/SRR27145287.fastq"
MAG_output="data/MAG/lr-ms/raven/assembly_raven_lr-ms.fasta"
log_dir="data/logs/lr-ms/raven/"
dataset="lr-ms"
task="raven"


mkdir -p ${log_dir}
log_file="${log_dir}/log_asm_${task}_${dataset}.log"

# Construct the command to be executed
command="$path_raven $raw_path $log_file"

# Execute the benchmark script with the constructed command
"$benchmark_script" "$command" -d "$dataset" -t "$task"
