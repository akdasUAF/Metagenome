#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Flye
## Dataset: lr-gut
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir data/process/flye/lr-gut/quast
python3 tools/analysis/quast/metaquast.py -c 12 -o data/process/flye/lr-gut/quast data/process/flye/lr-gut/assembly.fasta 