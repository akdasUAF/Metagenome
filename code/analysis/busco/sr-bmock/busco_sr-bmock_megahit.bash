#!/bin/env bash
script_to_execute="code/analysis/busco/run_busco.bash"
contig_path="data/MAG/sr-bmock/megahit_sr-bmock_contigs.fa"
analysis_output="data/analysis/sr-bmock/megahit/"
log_dir="data/analysis/sr-bmock/megahit/"
dataset="sr-bmock"
assembler="megahit"

mkdir -p $(dirname "$analysis_output")
mkdir -p ${log_dir}
log_file="${log_dir}/log_busco_${dataset}_${assembler}.log"

analysis_output="${analysis_output}/busco/"


# Execute the benchmark script with the constructed command
bash $script_to_execute $contig_path $analysis_output $log_file