#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Raven
## Dataset: Long read Soil
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir -p data/process/raven/lr-soil/quast
python3 tools/analysis/quast/metaquast.py --glimmer -t 12 -o data/process/raven/lr-soil/quast/ data/process/raven/lr-soil/assembly_raven_lr-soil.fasta