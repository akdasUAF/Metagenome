#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Metaspade
## Dataset: Short read gut
## Uses this dataset: 
## Analyzer: Busco

busco --auto-lineage -c 12 -m genome -i data/MAG/megahit/sr-gut/assembly.fasta -o data/process/megahit/sr-gut/busco
