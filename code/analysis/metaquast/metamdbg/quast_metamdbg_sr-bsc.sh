#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: metaspades
## Dataset: Short read BSC
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir -p data/analysis/metaspades/sr-bsc/quast
python3 tools/analysis/quast/metaquast.py -t 12 -o data/analysis/metaspades/sr-bsc/quast data/MAG/metaspades/sr-bsc/contigs.fasta --glimmer -r data/reference/sr-bsc/ref_combined_sr-bsc.fasta
