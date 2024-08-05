#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Megahit
## Dataset: Short read diabetes
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir -p data/analysis/megahit/sr-diabetes/quast
python3 tools/analysis/quast/metaquast.py -t 12 -o data/analysis/megahit/sr-diabetes/quast data/MAG/megahit/sr-diabetes/final.contigs.fa --glimmer 

# -r data/reference/sr-diabetes/ref_combined_sr-diabetes.fasta
