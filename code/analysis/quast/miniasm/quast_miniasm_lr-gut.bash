#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: miniasm
## Dataset: Long read Ecoli
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir -p data/process/miniasm/lr-gut/quast
python3 tools/analysis/quast/metaquast.py -t 12 -o data/process/miniasm/lr-gut/quast data/process/miniasm/lr-gut/polished_assembly_minimap_lr-gut.fa
python3 tools/analysis/quast/metaquast.py --glimmer -t 12 -o data/process/miniasm/lr-gut/quast data/process/miniasm/lr-gut/polished_assembly_minimap_lr-gut.fa
