#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Raven
## Dataset: Long read Soil
## Uses this dataset: 
## Analyzer: METAQUAST

python3 tools/analysis/quast/metaquast.py -o data/MAG/flye/lr-soil/quast data/process/flye/lr-soil/assembly.fasta 