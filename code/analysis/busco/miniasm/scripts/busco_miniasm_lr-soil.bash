#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: miniasm
## Dataset: Long read soil
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir data/process/miniasm/lr-soil/quast
python3 tools/analysis/quast/metaquast.py -o data/process/miniasm/lr-soil/quast data/process/miniasm/lr-soil/assembly_minimap_lr-soil.gfa