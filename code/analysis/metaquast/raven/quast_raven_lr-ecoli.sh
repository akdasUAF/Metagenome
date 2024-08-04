#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: raven
## Dataset: lr-ecoli
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir -p data/analysis/raven/lr-ecoli/quast
python3 tools/analysis/quast/metaquast.py -t 12 -o data/analysis/raven/lr-ecoli/quast data/MAG/raven/lr-ecoli/assembly_raven_lr-ecoli.fasta --glimmer -r data/reference/lr-ecoli/ref_combined_lr-ecoli.fasta
