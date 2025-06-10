#!/bin/env bash
benchmark_script="code/benchmarking/benchmark.bash"
path_megahit="code/assembly/megahit/run_megahit.sh"
raw_reads_dir="data/raw/sr-ms/"
path_output="data/megahit/sr-ms/"
path_log="data/megahit/"
dataset="sr-ms"
task="megahit"

mkdir -p ${path_log}
log_file="${path_log}/log_asm_${task}_${dataset}.log"


# Construct the command to be executed
command="$path_megahit $forward_reads $reverse_reads $path_output $log_file"

# Execute the benchmark script with the constructed command
bash $benchmark_script "$command" "$dataset" "$task"




