#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Canu
## Dataset: sr-gut
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir -p data/analysis/canu/sr-gut/quast
python3 tools/analysis/quast/metaquast.py -c 12 -o data/analysis/abyss/sr-gut/quast data/MAG/abyss/sr-gut/sr-gut.contigs.fasta