#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Flye
## Dataset: lr-soil
## Uses this dataset: 
## Analyzer: METAQUAST


mkdir -p data/process/flye/lr-soil/quast
python3 tools/analysis/quast/metaquast.py -t 12 -o data/process/flye/lr-soil/quast/ data/MAG/flye/lr-soil/assembly.fasta