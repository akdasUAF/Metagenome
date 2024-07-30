#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Megahit
## Dataset: Short read gut
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir -p data/process/megahit/sr-gut/quast
python3 tools/analysis/quast/metaquast.py -c 12 -o data/process/megahit/sr-gut/quast data/MAG/megahit/sr-gut/final.contigs.fa --glimmer

# -r data/MAG/megahit/sr-gut/quast/quast_corrected_input/combined_reference.fasta
