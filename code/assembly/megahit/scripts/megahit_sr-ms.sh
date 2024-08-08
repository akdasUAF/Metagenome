#!/bin/bash
benchmark_script="code/benchmarking/benchmark.bash"
path_megahit="code/processing/megahit/run_megahit.bash"
raw_dir="data/raw/sr-ms/"
MAG_output="data/process/sr-ms/"
path_log="data/logs/sr-ms/megahit/log_asm_megahit_sr-ms.sh"
dataset="sr-ms"
task="megahit"

# Construct the command to be executed
command="$path_megahit $raw_dir $MAG_output $path_log"

# Execute the benchmark script with the constructed command
"$benchmark_script" "$command" -d "$dataset" -t "$task"

