#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Flye
## Dataset: Long Read Marine Sediment
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir -p data/process/flye/lr-marine_sediment/quast
python3 tools/analysis/quast/metaquast.py -c 12 -o data/process/flye/lr-marine_sediment/quast data/process/flye/lr-marine_sediment/assembly.fasta