#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Canu
## Dataset: Long read Marine Sediment
## Uses this dataset: 
## Analyzer: busco

mkdir data/process/canu/lr-marine_sediment/busco
busco --auto-lineage -c 12 -m genome -i data/process/canu/lr-marine_sediment/lr-marine_sediment.contigs.fasta -o data/process/canu/lr-marine_sediment/busco
