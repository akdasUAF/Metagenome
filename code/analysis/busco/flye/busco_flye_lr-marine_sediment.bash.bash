#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: busco
## Dataset: Long Read Marine Sediment
## Uses this dataset: 
## Analyzer: Busco

mkdir data/process/flye/lr-marine_sediment/busco
python3 tools/analysis/busco/metaquast.py -o data/process/flye/lr-marine_sediment/quast data/process/flye/lr-marine_sediment/assembly.fasta 