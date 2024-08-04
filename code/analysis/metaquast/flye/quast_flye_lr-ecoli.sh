#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: flye
## Dataset: lr-ecoli
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir -p data/analysis/flye/lr-ecoli/quast
python3 tools/analysis/quast/metaquast.py -t 12 -o data/analysis/flye/lr-ecoli/quast data/MAG/flye/lr-ecoli/assembly.fasta --glimmer -r data/reference/lr-ecoli/ref_combined_lr-ecoli.fasta
