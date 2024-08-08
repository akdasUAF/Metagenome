#!/bin/bash

benchmark_script="code/benchmarking/benchmark.bash"
fastp_script="code/processing/fastp/run_fastp.bash"
raw_dir="data/raw/sr-bsc/"
trimmed_dir="data/process/sr-bsc/"
analysis_dir="data/analysis/sr-bsc/"
dataset="sr-bsc"
task="fastp"

# Construct the command to be executed
command="$fastp_script $raw_dir $trimmed_dir $analysis_dir"

# Execute the benchmark script with the constructed command
"$benchmark_script" "$command" -d "$dataset" -t "$task"