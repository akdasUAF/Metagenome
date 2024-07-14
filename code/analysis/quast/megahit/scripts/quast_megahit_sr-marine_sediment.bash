#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Megahit
## Dataset: Short read marine_sediment
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir -p data/process/megahit/sr-marine_sediment/quast
python3 tools/analysis/quast/metaquast.py -c 12 -o data/process/megahit/sr-marine_sediment/quast data/process/megahit/sr-marine_sediment/final.contigs.fa --glimmer

# -r data/process/megahit/sr-marine_sediment/quast/quast_corrected_input/combined_reference.fasta
