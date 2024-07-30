#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Canu
## Dataset: Long read Gut
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir -p data/MAG/canu/lr-gut/quast
python3 tools/analysis/quast/metaquast.py --glimmer -t 12 -o data/MAG/canu/lr-gut/quast data/MAG/canu/lr-gut/lr-gut.contigs.fasta