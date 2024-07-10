#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Megahit
## Dataset: Short read Diabetes
## Uses this dataset: 
## Analyzer: busco

mkdir -p data/process/megahit/sr-diabetes/quast
python3 tools/analysis/quast/metaquast.py -o data/process/megahit/sr-diabetes/quast/ data/process/megahit/sr-diabetes/final.contigs.fa

 -r data/reference/

 busco --auto-lineage -m genome -i data/process/megahit/sr-gut/assembly.fasta -o data/process/flye/lr-soil/busco
