#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Megahit
## Dataset: Short read BSC
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir -p data/analysis/megahit/sr-bsc/quast
python3 tools/analysis/quast/metaquast.py -t 12 -o data/analysis/megahit/sr-bsc/quast data/MAG/megahit/sr-bsc/final.contigs.fa --glimmer

# -r data/MAG/megahit/sr-bsc/quast/quast_corrected_input/combined_reference.fasta
