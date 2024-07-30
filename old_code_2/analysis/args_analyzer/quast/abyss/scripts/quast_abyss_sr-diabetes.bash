#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Abyss
## Dataset: Short read Diabetes
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir -p data/MAG/abyss/sr-diabetes/quast
python3 tools/analysis/quast/metaquast.py -t 12 -o data/process/abyss/sr-diabetes/quast data/MAG/abyss/sr-diabetes/abyss_sr-diabetes-contigs.fa