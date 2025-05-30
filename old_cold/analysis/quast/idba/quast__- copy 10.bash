#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Canu
## Dataset: Long read Ecoli
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir data/process/canu/lr-ecoli/quast
python3 tools/analysis/quast/metaquast.py -o data/process/canu/lr-ecoli/quast data/MAG/canu/lr-ecoli/lr-ecoli.contigs.fasta