#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: miniasm
## Dataset: lr-soil
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir -p data/process/miniasm/lr-soil/quast
python3 tools/analysis/quast/metaquast.py --glimmer -t 12 -o data/process/miniasm/lr-soil/quast data/MAG/miniasm/lr-soil/polished_assembly_minimap_lr-soil.fa