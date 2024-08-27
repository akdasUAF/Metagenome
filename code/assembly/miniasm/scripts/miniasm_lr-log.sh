#!/bin/env bash
benchmark_script="code/benchmarking/benchmark.bash"
path_miniasm="code/assembly/miniasm/run_miniasm.sh"
reads_in="data/lr-log/raw/Zymo-GridION-LOG-BB-SN.fq"
mag_output="data/lr-log/miniasm/"
dataset="lr-log"
task="miniasm"

mkdir -p $(dirname "$mag_output")

# Construct the command to be executed
command="$path_miniasm $reads_in $mag_output $dataset"

# Execute the benchmark script with the constructed command
bash $benchmark_script "$command" $dataset $task
