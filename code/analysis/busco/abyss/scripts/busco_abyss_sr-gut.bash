#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: abyss
## Dataset: Long read Ecoli
## Uses this dataset: 
## Analyzer: Busco

mkdir -p data/process/abyss/sr-gut/busco
busco --auto-lineage -m genome -i data/process/abyss/sr-gut/sr-gut.contigs.fasta -o data/process/abyss/sr-gut/busco
