#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Canu
## Dataset: Long read Soil
## Uses this dataset: 
## Analyzer: Busco

busco --auto-lineage -c 12 -m genome -i data/process/canu/lr-soil/lr-soil.contigs.fasta -o data/process/canu/lr-soil/busco
