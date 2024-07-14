#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: idba
## Dataset: Short Read Marine_sediment
## Uses this dataset: 
## Analyzer: Busco

mkdir data/process/idba/sr-marine_sediment/busco
busco --auto-lineage -c 12 -m genome -i data/process/idba/sr-marine_sediment/assembly.fasta -o data/process/idba/sr-marine_sediment/busco

