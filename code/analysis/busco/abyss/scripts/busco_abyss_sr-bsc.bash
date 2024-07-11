#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Abyss
## Dataset: Short read BSC
## Uses this dataset: 
## Analyzer: Busco

mkdir -p data/process/abyss/sr-bsc/busco
busco --auto-lineage -m genome -i data/process/abyss/sr-bsc/sr-bsc.contigs.fasta -o data/process/abyss/sr-bsc/busco
