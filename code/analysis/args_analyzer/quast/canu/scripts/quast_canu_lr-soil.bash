#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Canu
## Dataset: Long read Soil
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir data/process/canu/lr-soil/quast
python3 tools/analysis/quast/metaquast.py --glimmer -t 4 -o data/process/canu/lr-soil/quast data/MAG/canu/lr-soil/lr-soil.contigs.fasta