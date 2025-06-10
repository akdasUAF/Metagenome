#!/bin/env bash
benchmark_script="code/benchmarking/benchmark.bash"
path_metaspades="code/assembly/metaspades/run_metaspades.sh"
path_forward="data/raw/sr-even/sr-even_1_trimmed.fastq"
path_reverse="data/raw/sr-even/sr-even_2_trimmed.fastq"
path_output="data/metaspades/sr-even/"
path_log="data/metaspades/logs/"
dataset="sr-even"
task="metaspades"

rm -rf $(dirname "$path_output")
mkdir -p ${path_log}
log_file="${path_log}/log_asm_${task}_${dataset}.log"

# Construct the command to be executed
command="$path_metaspades $path_forward $path_reverse $path_output $log_file"

# Execute the benchmark script with the constructed command
bash $benchmark_script "$command" $dataset $task
