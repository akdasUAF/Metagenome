#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: miniasm
## Dataset: lr-ecoli
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir data/process/miniasm/lr-ecoli/quast
python3 tools/analysis/quast/metaquast.py --glimmer -t 12 -o data/process/miniasm/lr-ecoli/quast data/process/miniasm/lr-ecoli/assembly_minimap_lr-ecoli.gfa
