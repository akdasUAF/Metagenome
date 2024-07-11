#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Megahit
## Dataset: Short read Diabetes
## Uses this dataset: 
## Analyzer: Busco

mkdir -p data/process/megahit/sr-diabetes/busco

busco --auto-lineage -m genome -i data/process/megahit/sr-diabetes/assembly.fasta -o data/process/megahit/sr-diabetes/busco

