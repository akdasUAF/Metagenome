#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Flye
## Dataset: Long read E.coli
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir data/process/flye/lr-ecoli/quast
python3 tools/analysis/quast/metaquast.py --glimmer -t 12 -o data/process/raven/lr-ecoli/quast/ data/process/raven/lr-ecoli/assembly_raven_lr-ecoli.fasta