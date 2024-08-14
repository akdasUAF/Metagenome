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
command='conda run -n asm_raven "tools/assemblers/raven/build/bin/raven -t 24 data/raw/lr-ms/SRR27145287/SRR27145287.fastq > data/MAG/raven/lr-ms/assembly_raven_lr-ms.fasta 2> data/analysis/raven/lr-ms/log_assemble_raven_lr-ms.log"'

# Execute the benchmark script with the constructed command
"$benchmark_script" "conda run -n asm_raven bash source -c '$command'" -d "$dataset" -t "$task"

