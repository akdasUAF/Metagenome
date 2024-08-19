#!/bin/env bash
script_to_execute="code/analysis/assembly-stats/run_assembly-stats.sh"
contig_path="data/MAG/sr-bmock/sr-bmock_metaspades_contigs.fasta"
log_dir="data/analysis/sr-bmock/metaspades/"
dataset="sr-bmock"
assembler="metaspades"

mkdir -p ${log_dir}
log_file="${log_dir}/log_as_${dataset}_${assembler}.log"


# Execute the benchmark script with the constructed command
bash $script_to_execute $contig_path $log_file