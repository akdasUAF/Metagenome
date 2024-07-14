#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Flye
## Dataset: Long read Soil
## Uses this dataset: 
## Analyzer: METAbusco


mkdir -p data/process/flye/lr-soil/busco
busco --auto-lineage -c 12 -m genome -i data/process/flye/lr-soil/assembly.fasta -o data/process/flye/lr-soil/busco
