#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Megahit
## Dataset: sr-bmock
## Uses this dataset: 
## Analyzer: METAQUAST

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