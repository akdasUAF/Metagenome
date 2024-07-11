#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Flye
## Dataset: Long read Soil
## Uses this dataset: 
## Analyzer: Busco

mkdir data/process/flye/lr-ecoli/busco

busco --auto-lineage -m genome -i data/process/flye/lr-ecoli/assembly.fasta -o data/process/flye/lr-ecoli/busco

