#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Canu
## Dataset: Long read Gut
## Uses this dataset: 
## Analyzer: Busco

mkdir data/process/canu/lr-gut/busco
busco --auto-lineage -m genome -i data/process/canu/lr-gut/lr-gut.contigs.fasta -o data/process/canu/lr-gut/busco
