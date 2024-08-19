#!/bin/env bash
script_to_execute="code/analysis/busco/run_busco.bash"
contig_path="data/MAG/sr-bmock/sr-bmock_metaspades_contigs.fasta"
analysis_output="data/analysis/sr-bmock/metaspades/"
log_dir="data/analysis/sr-bmock/metaspades/"
dataset="sr-bmock"
assembler="metaspades"

mkdir -p $(dirname "$analysis_output")
mkdir -p ${log_dir}
log_file="${log_dir}/log_busco_${dataset}_${assembler}.log"


# Execute the benchmark script with the constructed command
bash $script_to_execute $contig_path $analysis_output $log_file