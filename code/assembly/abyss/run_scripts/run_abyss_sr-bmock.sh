#!/bin/bash
benchmark_script="code/benchmarking/benchmark.bash"
path_megahit="code/assembly/megahit/run_megahit.sh"
raw_dir="data/process/sr-bmock/trimmed/"
MAG_output="data/MAG/sr-bmock/abyss/"
path_log="data/logs/sr-bmock/megahit/"
dataset="sr-bmock"
task="megahit"


mkdir -p ${path_log}
log_file="${path_log}/log_asm_${task}_${dataset}.log"


# Construct the command to be executed
command="abyss-pe k=41 name=abyss_sr-bmock B=500G j = 24 \
	in='data/process/sr-bmock/trimmed/sr-bmock_trimmed_1.fastq data/process/sr-bmock/trimmed/sr-bmock_trimmed_2.fastq' v=-v | tee $log_file" 

# Execute the benchmark script with the constructed command
"$benchmark_script" "$command" -d "$dataset" -t "$task"

