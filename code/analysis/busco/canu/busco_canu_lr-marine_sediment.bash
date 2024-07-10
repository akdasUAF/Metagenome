#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Canu
## Dataset: Long read Marine Sediment
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir data/process/canu/lr-marine_sediment/quast
python3 tools/analysis/quast/metaquast.py -o data/process/canu/lr-marine_sediment/quast data/process/canu/lr-marine_sediment/lr-marine_sediment.contigs.fasta