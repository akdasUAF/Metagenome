#!/bin/env bash
benchmark_script="code/benchmarking/benchmark.bash"
path_miniasm="code/assembly/miniasm/run_miniasm.sh"
reads_in="data/lr-pasture/raw/lr-pasture_raw.fastq"
path_output="data/lr-pasture/miniasm/"
dataset="lr-pasture"
task="miniasm"

mkdir -p $(dirname "$path_output")

# Construct the command to be executed
command="$path_miniasm $reads_in $path_output $dataset"

# Execute the benchmark script with the constructed command
bash $benchmark_script "$command" $dataset $task
