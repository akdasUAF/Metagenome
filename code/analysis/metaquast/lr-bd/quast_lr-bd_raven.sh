#!/bin/env bash
## Script to analyze the quality of the metagenomes
## Assembler: Raven
## Dataset: lr-bd
## Analyzer: METAQUAST
script_to_execute="code/analysis/metaquast/run_metaquast.bash"
contig_path="data/MAG/lr-bd/assembly_raven_lr-bd.fasta"
analysis_output="data/lr-bd/raven/"
log_dir="data/lr-bd/raven/"
dataset="lr-bd"
assembler="raven"


#### ~~~~~~~~~~ Metaquast only
reference_path="data/reference/lr_synth/Genomes/Bacillus_subtilis_complete_genome.fasta,data/reference/lr_synth/Genomes/Listeria_monocytogenes_complete_genome.fasta,data/reference/lr_synth/Genomes/Salmonella_enterica_complete_genome.fasta,data/reference/lr_synth/Genomes/Enterococcus_faecalis_complete_genome.fasta,data/reference/lr_synth/Genomes/Pseudomonas_aeruginosa_complete_genome.fasta,data/reference/lr_synth/Genomes/Staphylococcus_aureus_complete_genome.fasta,data/reference/lr_synth/Genomes/Escherichia_coli_complete_genome.fasta,data/reference/lr_synth/Genomes/Saccharomyces_cerevisiae_draft_genome.fasta,data/reference/lr_synth/ssrRNAs/Bacillus_subtilis_16S_170923.fasta,data/reference/lr_synth/ssrRNAs/Enterococcus_faecalis_16S_170923.fasta,data/reference/lr_synth/ssrRNAs/Escherichia_coli_16S_170923.fasta,data/reference/lr_synth/ssrRNAs/Listeria_monocytogenes_16S_170923.fasta,data/reference/lr_synth/ssrRNAs/Pseudomonas_aeruginosa_16S_170923.fasta,data/reference/lr_synth/ssrRNAs/Saccharomyces_cerevisiae_18S_170924.fasta,data/reference/lr_synth/ssrRNAs/Saccharomyces_cerevisiae_mitochondria_ssrRNA.fasta,data/reference/lr_synth/ssrRNAs/Salmonella_enterica_16S_170923.fasta,data/reference/lr_synth/ssrRNAs/Staphylococcus_aureus_16S_170923.fasta"

mkdir -p $(dirname "$analysis_output")
mkdir -p ${log_dir}
log_file="${log_dir}/log_metaquast_${dataset}_${assembler}.log"

analysis_output="${analysis_output}/busco/"

# Execute the benchmark script with the constructed command
bash $script_to_execute $contig_path $analysis_output $log_file $reference_path
