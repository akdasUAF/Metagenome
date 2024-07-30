#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: abyss
## Dataset: Long read Ecoli
## Uses this dataset: 
## Analyzer: busco

mkdir -p data/assembled_MAG//abyss/sr-marine_sediment/busco
busco --auto-lineage -c 12 -m genome -i data/assembled_MAG//abyss/sr-marine_sediment/sr-marine_sediment.contigs.fasta -o data/assembled_MAG//abyss/sr-marine_sediment/busco
