#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Abyss
## Dataset: Short read BSC
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir -p data/process/abyss/sr-bsc/quast
python3 tools/analysis/quast/metaquast.py -t 12 -o data/process/abyss/sr-bsc/quast data/process/abyss/sr-bsc/abyss_sr-bsc-contigs.fa