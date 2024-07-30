#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Flye
## Dataset: lr-ecoli
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir data/process/flye/lr-ecoli/quast
python3 tools/analysis/quast/metaquast.py -c 12 -o data/process/flye/lr-ecoli/quast data/MAG/flye/lr-ecoli/assembly.fasta 