#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Abyss
## Dataset: Short read BSC
## Uses this dataset: 
## Analyzer: Busco

busco --auto-lineage -c 12 -m genome -i data/assembled_MAG//abyss/sr-bsc/abyss_sr-bsc-contigs.fa -o data/assembled_MAG//abyss/sr-bsc/busco
