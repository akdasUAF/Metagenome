#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Flye
## Dataset: lr-synth
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir data/process/flye/lr-synth/quast
python3 tools/analysis/quast/metaquast.py -c 12 -o data/process/flye/lr-synth/quast data/process/flye/lr-synth/assembly.fasta 