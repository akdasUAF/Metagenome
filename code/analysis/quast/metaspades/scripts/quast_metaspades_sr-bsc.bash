#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: METASPADES
## Dataset: sr-bsc
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir -p data/process/metaspades/sr-bsc/quast
# python3 tools/analysis/quast/metaquast.py -t 12 -o data/process/metaspades/sr-bsc/quast data/process/metaspades/sr-bsc/contigs.fasta 
python3 tools/analysis/quast/metaquast.py --glimmer -t 12 -o data/process/metaspades/sr-bsc/quast data/process/metaspades/sr-bsc/contigs.fasta 