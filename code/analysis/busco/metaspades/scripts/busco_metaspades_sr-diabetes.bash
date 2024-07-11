#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Metaspade
## Dataset: Short read Diabetes
## Uses this dataset: 
## Analyzer: Busco

mkdir data/process/metaspades/sr-diabetes/busco
busco --auto-lineage -m genome -i data/process/megahit/sr-diabetes/assembly.fasta -o data/process/megahit/sr-diabetes/busco
