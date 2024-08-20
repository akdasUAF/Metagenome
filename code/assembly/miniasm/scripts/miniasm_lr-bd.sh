#!/bin/env bash
benchmark_script="code/benchmarking/benchmark.bash"
path_miniasm="code/assembly/miniasm/run_miniasm.sh"
reads_in="data/raw/lr-synth/SRR22366767/SRR22366767.fastq"
mag_output="data/MAG/lr-bd/miniasm/"
dataset="lr-bd"
task="miniasm"

mkdir -p $(dirname "$mag_output")

# Construct the command to be executed
command="$path_miniasm $reads_in $mag_output $dataset"

# Execute the benchmark script with the constructed command
bash $benchmark_script "$command" $dataset $task
