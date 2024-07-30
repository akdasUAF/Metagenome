#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Canu
## Dataset: Long read Ecoli
## Uses this dataset: 
## Analyzer: METAQUAST

python3 tools/analysis/quast/metaquast.py -o data/MAG/canu/lr-ecoli/quast data/process/canu/lr-ecoli/lr-ecoli.contigs.fasta