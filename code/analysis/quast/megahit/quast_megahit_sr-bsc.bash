#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Megahit
## Dataset: Short read Soil (BSC)
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir -p data/process/megahit/sr-bsc/quast
python3 tools/analysis/quast/metaquast.py -o data/process/megahit/sr-bsc/quast 

 -r data/reference/