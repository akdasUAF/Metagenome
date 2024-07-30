#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Canu
## Dataset: Long read Ecoli
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir -p data/process/canu/lr-synth/quast
python3 tools/analysis/quast/metaquast.py --glimmer -t 12 -o data/process/canu/lr-synth/quast data/MAG/canu/lr-synth/lr-synth.contigs.fasta