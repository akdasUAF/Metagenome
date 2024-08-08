#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: metamdbg
## Dataset: Short read BSC
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir -p data/analysis/metamdbg/sr-bsc/quast
python3 tools/analysis/quast/metaquast.py -t 24 -o data/analysis/metamdbg/sr-bsc/quast data/MAG/metamdbg/sr-bsc/contigs.fasta --glimmer
