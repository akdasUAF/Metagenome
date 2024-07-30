#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Raven
## Dataset: Long read Soil
## Uses this dataset: 
## Analyzer: Busco


busco --auto-lineage -c 12 -m genome -i data/MAG/raven/lr-soil/assembly_raven_lr-soil.fasta -o data/process/raven/lr-soil/busco/
