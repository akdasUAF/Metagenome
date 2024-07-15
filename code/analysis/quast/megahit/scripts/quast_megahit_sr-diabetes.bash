#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Megahit
## Dataset: Short read diabetes
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir -p data/process/megahit/sr-diabetes/quast
python3 tools/analysis/quast/metaquast.py -t 12 -o data/process/megahit/sr-diabetes/quast data/process/megahit/sr-diabetes/final.contigs.fa --glimmer

# -r data/process/megahit/sr-diabetes/quast/quast_corrected_input/combined_reference.fasta
