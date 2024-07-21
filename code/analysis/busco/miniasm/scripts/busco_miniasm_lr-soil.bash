#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: miniasm
## Dataset: lr-soil
## Uses this dataset: 
## Analyzer: Busco

busco --auto-lineage -c 12 -m genome -i data/process/miniasm/lr-soil/polished_assembly_minimap_lr-soil.fa -o data/process/miniasm/lr-soil/busco

