#!/bin/env bash
## Script to analyze the quality of the metagenomes
## Assembler: Megahit
## Dataset: sr-log
## Uses this dataset: 
## Analyzer: METAQUAST
benchmark_script="code/analysis/metaquast/run_metaquast.bash"
path_megahit="code/assembly/megahit/run_megahit.sh"
path_contigs=""
path_output="data/sr-log/"
dataset="sr-log"
assembler="megahit"

### Metaquast only
path_references="code/analysis/metaquast/sr-bmock/sr-bmock_reference_paths.txt"


quast_output="${path_output}/quast/${assembler}"
mkdir -p $quast_output

mkdir -p ${log_dir}/log/
log_file="${log_dir}/log/log_asm_${task}_${dataset}.log"

# Construct the command to be executed
command="$path_megahit $path_contigs $quast_output $dataset"

# Execute the benchmark script with the constructed command
bash $benchmark_script "$command" $dataset $assembler


path_contigs=$1
path_output=$2
path_log=$3
path_reference=$4


mkdir -p data/analysis/sr-bmock/megahit/quast
python3 tools/analysis/quast/metaquast.py -t 24 -o data/analysis/sr-bmock/megahit/quast data/MAG/megahit/sr-bmock/megahit_sr-bmock_contigs.fa --glimmer --references-list data/reference/sr-bmock_reference/sr-bmock_reference_paths.txt


## Megahit
python3 tools/analysis/quast/metaquast.py -t 24 -o data/analysis/sr-bmock/megahit/quast data/MAG/megahit/sr-bmock/megahit_sr-bmock_contigs.fa --glimmer \
-r data/reference/sr-bmock_reference/assembled_genomes/Cohaesibacter_es.047_final-assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Halomonas_HL-4_final-assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Halomonas_HL-93_final-assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Marinobacter_LV10MA510-1_final-assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Marinobacter_LV10R510-8_final-assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Micromonospora_coxensis_final-assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Micromonospora_echinaurantiaca_final-assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Micromonospora_echinofusca_final-assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Muricauda_ES.050_final-assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Propionibacteriaceae_bacterium_ES.041_final_assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Psychrobacter_LV10R520-6_final-assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Thioclava_ES.032_final-assembled.fasta

## MetaSPAdes
python3 tools/analysis/quast/metaquast.py -t 24 -o data/analysis/sr-bmock/metaspades/quast data/MAG/sr-bmock/sr-bmock_metaspades_contigs.fasta --glimmer \
-r data/reference/sr-bmock_reference/assembled_genomes/Cohaesibacter_es.047_final-assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Halomonas_HL-4_final-assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Halomonas_HL-93_final-assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Marinobacter_LV10MA510-1_final-assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Marinobacter_LV10R510-8_final-assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Micromonospora_coxensis_final-assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Micromonospora_echinaurantiaca_final-assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Micromonospora_echinofusca_final-assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Muricauda_ES.050_final-assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Propionibacteriaceae_bacterium_ES.041_final_assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Psychrobacter_LV10R520-6_final-assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Thioclava_ES.032_final-assembled.fasta

## Unicycler
python3 tools/analysis/quast/metaquast.py -t 24 -o data/analysis/sr-bmock/unicycler/quast data/MAG/unicycler/sr-bmock_unicycler_contigs.fasta --glimmer \
-r data/reference/sr-bmock_reference/assembled_genomes/Cohaesibacter_es.047_final-assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Halomonas_HL-4_final-assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Halomonas_HL-93_final-assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Marinobacter_LV10MA510-1_final-assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Marinobacter_LV10R510-8_final-assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Micromonospora_coxensis_final-assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Micromonospora_echinaurantiaca_final-assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Micromonospora_echinofusca_final-assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Muricauda_ES.050_final-assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Propionibacteriaceae_bacterium_ES.041_final_assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Psychrobacter_LV10R520-6_final-assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Thioclava_ES.032_final-assembled.fasta


data/MAG/megahit/sr-log/final.contigs.fa