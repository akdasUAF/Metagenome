#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Megahit
## Dataset: Short read Gut
## Uses this dataset: 
## Analyzer: Busco


busco --auto-lineage -m genome -i data/process/megahit/sr-gut/assembly.fasta -o data/process/megahit/sr-gut/busco

