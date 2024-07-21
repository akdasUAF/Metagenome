#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Canu
## Dataset: Long read Ecoli
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir -p data/process/canu/lr-ecoli/quast
python3 tools/analysis/quast/metaquast.py --glimmer -t 12 -o data/process/canu/lr-ecoli/quast data/process/canu/lr-ecoli/lr-ecoli.contigs.fasta