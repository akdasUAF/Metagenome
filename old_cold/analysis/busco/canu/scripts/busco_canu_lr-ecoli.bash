#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Canu
## Dataset: Long read Ecoli
## Uses this dataset: 
## Analyzer: Busco


busco --auto-lineage -c 12 -m genome -i data/assembled_MAG//canu/lr-ecoli/lr-ecoli.contigs.fasta -o data/process/canu/lr-ecoli/busco

