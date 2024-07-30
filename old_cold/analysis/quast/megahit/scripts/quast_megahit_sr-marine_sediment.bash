#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Megahit
## Dataset: Short read marine_sediment
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir -p data/process/megahit/sr-marine_sediment/quast
# python3 tools/analysis/quast/metaquast.py --glimmer -t 12 -o data/process/megahit/sr-marine_sediment/quast data/MAG/megahit/sr-marine_sediment/final.contigs.fa
python3 tools/analysis/quast/metaquast.py -t 12 -o data/process/megahit/sr-marine_sediment/quast data/MAG/megahit/sr-marine_sediment/final.contigs.fa
