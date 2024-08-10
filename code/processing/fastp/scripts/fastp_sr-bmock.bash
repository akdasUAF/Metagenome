#!/bin/bash

benchmark_script="code/benchmarking/benchmark.bash"
fastp_script="code/processing/fastp/run_fastp.bash"
raw_dir="data/raw/sr-bmock/"
trimmed_dir="data/process/sr-bmock/"
analysis_dir="data/analysis/sr-bmock/"
dataset="sr-bmock"
task="fastp"

# Construct the command to be executed
command="$fastp_script $raw_dir $trimmed_dir $analysis_dir"

# Execute the benchmark script with the constructed command
"$benchmark_script" "$command" -d "$dataset" -t "$task"