#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: abyss
## Dataset: Long read Ecoli
## Uses this dataset: 
## Analyzer: Busco

mkdir -p data/assembled_MAG//abyss/sr-gut/busco
busco --auto-lineage -c 12 -m genome -i data/assembled_MAG//abyss/sr-gut/sr-gut.contigs.fasta -o data/assembled_MAG//abyss/sr-gut/busco
