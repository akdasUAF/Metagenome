#!/bin/bash
benchmark_script="code/benchmarking/benchmark.bash"
path_megahit="code/assembly/megahit/run_megahit.sh"
forward_reads="data/sr-log/trimmed/sr-log_trimmed_1.fastq"
reverse_reads="data/sr-log/trimmed/sr-log_trimmed_2.fastq"
path_output="data/sr-log/megahit/"
path_log="data/sr-log/log/megahit/"
dataset="sr-log"
task="megahit"


mkdir -p ${path_log}
log_file="${path_log}/log_asm_${task}_${dataset}.log"


# Construct the command to be executed
command="$path_megahit $forward_reads $reverse_reads $path_output $log_file"

# Execute the benchmark script with the constructed command
"$benchmark_script" "$command" -d "$dataset" -t "$task"

