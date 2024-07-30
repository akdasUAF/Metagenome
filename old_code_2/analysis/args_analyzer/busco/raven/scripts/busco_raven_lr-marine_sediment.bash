#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Raven
## Dataset: Long Read Ecoli
## Uses this dataset: 
## Analyzer: METAQUAST

python3 tools/analysis/quast/metaquast.py -o data/MAG/raven/lr-marine_sediment/quast data/process/raven/lr-marine_sediment/assembly_raven_lr-marine_sediment.fasta