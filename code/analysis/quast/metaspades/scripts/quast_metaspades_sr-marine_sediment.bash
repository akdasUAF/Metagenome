#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: METASPADES
## Dataset: sr-marine_sediment
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir -p data/process/metaspades/sr-marine_sediment/quast
# python3 tools/analysis/quast/metaquast.py -t 12 -o data/process/metaspades/sr-marine_sediment/quast data/process/metaspades/sr-marine_sediment/contigs.fasta 
python3 tools/analysis/quast/metaquast.py --glimmer -t 12 -o data/process/metaspades/sr-marine_sediment/quast data/process/metaspades/sr-marine_sediment/contigs.fasta 