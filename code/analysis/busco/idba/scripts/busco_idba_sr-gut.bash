#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: idba
## Dataset: Short Read Gut
## Uses this dataset: 
## Analyzer: Busco

mkdir data/process/idba/sr-gut/busco
busco --auto-lineage -m genome -i data/process/idba/sr-gut/assembly.fasta -o data/process/idba/sr-gut/busco

