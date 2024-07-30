#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: raven
## Dataset: lr-synth
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir -p data/process/raven/lr-synth/quast
python3 tools/analysis/quast/metaquast.py --glimmer -t 12 -o data/process/raven/lr-synth/quast/ data/process/raven/lr-synth/assembly_raven_lr-synth.fasta