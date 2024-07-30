#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: METASPADES
## Dataset: sr-diabetes
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir -p data/process/metaspades/sr-diabetes/quast
python3 tools/analysis/quast/metaquast.py --glimmer -t 12 -o data/process/metaspades/sr-diabetes/quast data/MAG/metaspades/sr-diabetes/contigs.fasta 