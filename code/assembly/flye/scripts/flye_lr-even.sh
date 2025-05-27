#!/bin/env bash
## Dataset: Long-read Synthetic
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/PRJNA903965
## Assembler: Flye 
benchmark_script="code/benchmarking/benchmark.bash"
path_flye="code/assembly/flye/run_metaflye.sh"
raw_path="data/raw/lr-even/lr-even_raw.fastq"
output_path="data/flye/lr-even"
log_dir="data/flye/logs/"
dataset="lr-even"
task="flye"


mkdir -p $output_path
mkdir -p ${log_dir}
log_file="${log_dir}/log_asm_${task}_${dataset}.log"

# Construct the command to be executed
command="$path_flye $raw_path $output_path $log_file"

# Execute the benchmark script with the constructed command
bash $benchmark_script "$command" $dataset $task


