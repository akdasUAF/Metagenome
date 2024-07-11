#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Canu
## Dataset: Long read Ecoli
## Uses this dataset: 
## Analyzer: Busco

mkdir data/process/canu/lr-ecoli/busco
busco --auto-lineage -m genome -i data/process/canu/lr-ecoli/lr-ecoli.contigs.fasta -o data/process/canu/lr-ecoli/busco

