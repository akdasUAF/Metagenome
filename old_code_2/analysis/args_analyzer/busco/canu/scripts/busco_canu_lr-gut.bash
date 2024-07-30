#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Canu
## Dataset: Long read Gut
## Uses this dataset: 
## Analyzer: Busco

busco --auto-lineage -c 12 -m genome -i data/assembled_MAG//canu/lr-gut/lr-gut.contigs.fasta -o data/process/canu/lr-gut/busco
