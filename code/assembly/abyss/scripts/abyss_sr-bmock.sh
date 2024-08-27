#!/bin/env bash
benchmark_script="code/benchmarking/benchmark.bash"
path_abyss="code/assembly/abyss/run_abyss.sh"
path_forward="sr-bmock/trimmed/sr-bmock_trimmed_1.fastq"
path_reverse="sr-bmock/trimmed/sr-bmock_trimmed_2.fastq"
path_output="data/sr-bmock/abyss/"
path_log="data/sr-bmock/logs"
dataset="sr-bmock"
task="abyss"

######~~~~~~~~~~~~ Abyss Only
kmer="117"
bloom="10G"
name_assembly="${task}_${dataset}"


mkdir -p ${path_log}
log_file="${path_log}/log_asm_${task}_${dataset}.log"



# Construct the command to be executed
command="${path_abyss} ${path_forward} ${path_reverse} ${path_output} ${name_assembly} ${kmer} ${bloom} ${log_file}"

# Execute the benchmark script with the constructed command
bash $benchmark_script "$command" $dataset $task