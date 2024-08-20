#!/bin/env bash

if [ $# -ne 3 ]; then
  echo "Usage: $0 <raw_path> <MAG_path> <log_path>"
  exit 1
fi

path_contigs=$1
path_output=$2
path_log=$3

python3 tools/analysis/quast/metaquast.py -t 24 -o $path_output data/MAG/megahit/sr-bmock/megahit_sr-bmock_contigs.fa --glimmer \
-r data/reference/sr-bmock_reference/assembled_genomes/Cohaesibacter_es.047_final-assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Halomonas_HL-4_final-assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Halomonas_HL-93_final-assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Marinobacter_LV10MA510-1_final-assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Marinobacter_LV10R510-8_final-assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Micromonospora_coxensis_final-assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Micromonospora_echinaurantiaca_final-assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Micromonospora_echinofusca_final-assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Muricauda_ES.050_final-assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Propionibacteriaceae_bacterium_ES.041_final_assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Psychrobacter_LV10R520-6_final-assembly.fasta,data/reference/sr-bmock_reference/assembled_genomes/Thioclava_ES.032_final-assembled.fasta
