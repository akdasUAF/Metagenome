#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: abyss
## Dataset: Long read Ecoli
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir -p data/MAG/abyss/sr-marine_sediment/quast
python3 tools/analysis/quast/metaquast.py -t 12 -o data/process/abyss/sr-marine_sediment/quast data/MAG/abyss/sr-marine_sediment/abyss_sr-marine_sediment-contigs.fa