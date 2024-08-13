#!/bin/env bash
benchmark_script="code/benchmarking/benchmark.bash"
path_metaspades="./tools/assemblers/raven/build/bin/raven"
raw_dir="data/process/lr-bd/trimmed/"
MAG_output="data/MAG/metaspades/sr-bmock/"
path_log="data/logs/lr-bd/metaspades/"
dataset="lr-bd"
task="raven"


mkdir -p ${path_log}
log_file="${path_log}/log_asm_${task}_${dataset}.log"


# Construct the command to be executed
command="./tools/assemblers/raven/build/bin/raven -t 24 data/raw/lr-bd/SRR22366767/SRR22366767.fastq > data/MAG/lr-bd/raven/assembly_raven_lr-ecoli.fasta 2> data/analysis/lr-bd/log_assemble_raven_lr-ecoli.log"



# Execute the benchmark script with the constructed command
"$benchmark_script" "conda run -n asm_raven bash $command" -d "$dataset" -t "$task"
