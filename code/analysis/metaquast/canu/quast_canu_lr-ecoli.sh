#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: canu
## Dataset: lr-ecoli
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir -p data/analysis/canu/lr-ecoli/quast
python3 tools/analysis/quast/metaquast.py -t 12 -o data/analysis/canu/lr-ecoli/quast data/MAG/canu/lr-ecoli/lr-ecoli.contigs.fasta --glimmer -r data/reference/lr-ecoli/ref_combined_lr-ecoli.fasta
