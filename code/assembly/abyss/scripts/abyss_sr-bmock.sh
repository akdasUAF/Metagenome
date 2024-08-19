#!/bin/env bash
## Assembler: abyss
## Dataset: sr-bmock
benchmark_script="code/benchmarking/benchmark.bash"
path_raven="code/assembly/abyss/run_abyss.sh"
raw_path="data/process/sr-bmock/trimmed/sr-bmock_trimmed_1.fastq data/process/sr-bmock/trimmed/sr-bmock_trimmed_2.fastq"
MAG_output="data/MAG/sr-bmock/abyss/"
log_dir="data/analysis/sr-bmock/abyss/logs/"
dataset="sr-bmock"
task="abyss"

#~~~ Abyss Only
kmer=117
bloom=10G
name_assembly="$dataset"_"$task"

## Building a log and making a directory for results
mkdir -p $(dirname "$MAG_output")
mkdir -p ${log_dir}
log_file="${log_dir}/log_asm_${task}_${dataset}.log"


# Construct the command to be executed
command="$path_raven $raw_path $MAG_output $log_file $name_assembly $kmer $bloom"

# Execute the benchmark script with the constructed command
bash $benchmark_script "$command" $dataset $task

"data/process/sr-bmock/trimmed/sr-bmock_trimmed_1.fastq data/process/sr-bmock/trimmed/sr-bmock_trimmed_2.fastq"
abyss-pe k=117 name=$name_assembly B=$bloom j=24 \
	in="data/process/sr-bmock/trimmed/sr-bmock_trimmed_1.fastq data/process/sr-bmock/trimmed/sr-bmock_trimmed_2.fastq" \
	out=data/MAG/sr-bmock/abyss/ v=-v 
