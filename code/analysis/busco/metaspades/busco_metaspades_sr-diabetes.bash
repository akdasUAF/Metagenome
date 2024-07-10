#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Canu
## Dataset: Long read Ecoli
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir data/process/metaspades/sr-diabetes/busco

busco --auto-lineage-prok -m genome -i data/process/metaspades/sr-diabetes/contigs.fasta -o data/process/metaspades/sr-diabetes/busco
