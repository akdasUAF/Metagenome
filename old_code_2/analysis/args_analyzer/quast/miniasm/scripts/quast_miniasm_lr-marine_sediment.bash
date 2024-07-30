#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: miniasm
## Dataset: lr-marine_sediment
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir data/process/miniasm/lr-ecoli/quast
python3 tools/analysis/quast/metaquast.py -t 12 -o data/process/miniasm/lr-marine_sediment/quast data/MAG/miniasm/lr-marine_sediment/polished_assembly_minimap_lr-marine_sediment.fa
