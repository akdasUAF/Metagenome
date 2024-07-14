#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Flye
## Dataset: Long read Soil
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir data/process/flye/lr-soil/quast
python3 tools/analysis/quast/metaquast.py -c 12 -o data/process/flye/lr-soil/quast data/process/flye/lr-soil/assembly.fasta 