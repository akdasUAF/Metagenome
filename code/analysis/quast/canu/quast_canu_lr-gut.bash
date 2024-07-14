#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Canu
## Dataset: Long read Gut
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir data/process/canu/lr-gut/quast
python3 tools/analysis/quast/metaquast.py -c 12 -o data/process/canu/lr-gut/quast data/process/canu/lr-gut/lr-gut.contigs.fasta