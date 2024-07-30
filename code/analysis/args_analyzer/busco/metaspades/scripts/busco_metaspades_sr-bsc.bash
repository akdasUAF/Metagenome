#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Metaspades
## Dataset: Short read BSC
## Uses this dataset: 
## Analyzer: Busco

busco --auto-lineage -c 12 -m genome -i data/MAG/metaspades/sr-bsc/contigs.fasta -o data/process/metaspades/sr-bsc/busco
