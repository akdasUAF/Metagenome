#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Canu
## Dataset: Long read Soil
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir data/process/canu/lr-soil/quast
python3 tools/analysis/quast/metaquast.py -o data/process/canu/lr-soil/quast data/process/canu/lr-soil/lr-soil.contigs.fasta