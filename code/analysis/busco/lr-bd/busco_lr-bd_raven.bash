#!/bin/env bash
script_to_execute="code/analysis/busco/run_busco.bash"
contig_path="data/MAG/lr-bd/assembly_raven_lr-bd.fasta"
analysis_output="data/lr-bd/raven/"
log_dir="data/lr-bd/raven/"
dataset="lr-bd"
assembler="raven"

mkdir -p $(dirname "$analysis_output")
mkdir -p ${log_dir}
log_file="${log_dir}/log_busco_${dataset}_${assembler}.log"

analysis_output="${analysis_output}/busco/"


# Execute the benchmark script with the constructed command
bash $script_to_execute $contig_path $analysis_output $log_file