#!/bin/env bash
## Dataset: Long-read Synthetic
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/PRJNA903965
## Assembler: Canu
benchmark_script="code/benchmarking/benchmark.bash"
path_flye="code/assembly/canu/run_canu.sh"
raw_reads="data/lr-bd/raw/lr-bd_raw.fastq"
output_path="data/lr-bd/canu/"
log_dir="data/lr-bd/canu/"
dataset="lr-bd"
task="canu"


#### ~~~~~~ Canu only
genomeSize="220000000"
name="${dataset}_task"

mkdir -p $output_path
mkdir -p ${log_dir}
log_file="${log_dir}/log_asm_${task}_${dataset}.log"

# Construct the command to be executed
command="$path_flye $raw_reads $output_path $genomeSize $name $log_file"

# Execute the benchmark script with the constructed command
bash $benchmark_script "$command" $dataset $task


