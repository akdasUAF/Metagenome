#!/bin/bash
benchmark_script="code/benchmarking/benchmark.bash"
path_megahit="code/assembly/megahit/run_megahit.sh"
path_forward="data/raw/sr-even/sr-even_1_trimmed.fastq"
path_reverse="data/raw/sr-even/sr-even_2_trimmed.fastq"
path_output="data/megahit/sr-even/"
path_log="data/megahit/logs/"
dataset="sr-even"
task="megahit"

mkdir -p ${path_log}
log_file="${path_log}/log_asm_${task}_${dataset}.log"


# Construct the command to be executed
command="$path_megahit $path_forward $path_reverse $path_output $log_file"

# Execute the benchmark script with the constructed command
bash $benchmark_script "$command" -d "$dataset" -t "$task"

