#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Megahit
## Dataset: Short read Soil (BSC)
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir -p data/process/megahit/sr-bsc/quast
python3 tools/analysis/quast/metaquast.py -o data/process/megahit/sr-bsc/quast -r data/reference/sr-bsc_reference/storage/faa/ data/process/megahit/sr-bsc/final.contigs.fa

python3 tools/analysis/quast/metaquast.py -o data/process/megahit/sr-bsc/quast -r data/process/megahit/sr-bsc/quast/quast_corrected_input/combined_reference.fasta data/process/megahit/sr-bsc/final.contigs.fa



data/process/megahit/sr-bsc/quast/quast_corrected_input/combined_reference.fasta
