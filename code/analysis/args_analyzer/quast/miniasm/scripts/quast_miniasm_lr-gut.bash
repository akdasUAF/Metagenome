#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: miniasm
## Dataset: lr-gut
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir -p data/process/miniasm/lr-gut/quast
python3 tools/analysis/quast/metaquast.py -t 12 -o data/process/miniasm/lr-gut/quast data/MAG/miniasm/lr-gut/polished_assembly_minimap_lr-gut.fa
