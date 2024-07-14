#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Metaspade
## Dataset: Short read gut
## Uses this dataset: 
## Analyzer: Busco

mkdir data/process/metaspades/sr-gut/busco
busco --auto-lineage -c 12 -m genome -i data/process/megahit/sr-gut/assembly.fasta -o data/process/megahit/sr-gut/busco
