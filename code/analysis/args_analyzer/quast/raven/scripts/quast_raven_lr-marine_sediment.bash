#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Raven
## Dataset: Long Read Ecoli
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir -p data/process/raven/lr-marine_sediment/quast
python3 tools/analysis/quast/metaquast.py --glimmer -t 12 -o data/process/raven/lr-marine_sediment/quast data/process/raven/lr-marine_sediment/assembly_raven_lr-marine_sediment.fasta