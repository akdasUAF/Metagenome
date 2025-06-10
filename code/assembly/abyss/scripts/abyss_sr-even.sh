#!/bin/env bash
benchmark_script="code/benchmarking/benchmark.bash"
path_abyss="code/assembly/abyss/run_abyss.sh"
forward_reads="data/raw/sr-even/sr-even_1_trimmed.fastq"
reverse_reads="data/raw/sr-even/sr-even_2_trimmed.fastq"
path_output="data/sr-even/abyss/"
path_log="data/logs/abyss/"
dataset="sr-even"
task="abyss"

######~~~~~~~~~~~~ Abyss Only
kmer="117"
bloom="10G"
name_assembly="${task}_${dataset}"


mkdir -p ${path_log}
log_file="${path_log}/log_asm_${task}_${dataset}.log"



# Construct the command to be executed
command="${path_abyss} ${forward_reads} ${reverse_reads} ${path_output} ${name_assembly} ${kmer} ${bloom} ${log_file}"

# Execute the benchmark script with the constructed command
bash $benchmark_script "$command" $dataset $task