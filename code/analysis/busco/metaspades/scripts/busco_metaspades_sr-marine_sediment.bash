#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Metaspade
## Dataset: Short read marine_sediment
## Uses this dataset: 
## Analyzer: Busco

mkdir data/process/metaspades/sr-marine_sediment/busco
busco --auto-lineage -m genome -i data/process/megahit/sr-marine_sediment/assembly.fasta -o data/process/megahit/sr-marine_sediment/busco
