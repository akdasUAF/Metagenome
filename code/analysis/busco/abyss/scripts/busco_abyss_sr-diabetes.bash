#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: abyss
## Dataset: Long read Ecoli
## Uses this dataset: 
## Analyzer: Busco	

mkdir -p data/process/abyss/sr-diabetes/busco
busco --auto-lineage -c 12 -m genome -i data/process/abyss/sr-diabetes/sr-diabetes.contigs.fasta -o data/process/abyss/sr-diabetes/busco
