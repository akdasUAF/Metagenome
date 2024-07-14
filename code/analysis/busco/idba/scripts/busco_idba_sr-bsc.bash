#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: idba
## Dataset: Short Read BSC
## Uses this dataset: 
## Analyzer: Busco

mkdir data/process/idba/sr-bsc/busco
busco --auto-lineage -c 12 -m genome -i data/process/idba/sr-bsc/assembly.fasta -o data/process/idba/sr-bsc/busco

