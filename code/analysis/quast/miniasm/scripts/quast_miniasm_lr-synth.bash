#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: miniasm
## Dataset: lr-synth
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir data/process/miniasm/lr-synth/quast
python3 tools/analysis/quast/metaquast.py --glimmer -t 12 -o data/process/miniasm/lr-synth/quast data/process/miniasm/lr-synth/assembly_minimap_lr-synth.gfa
