#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: miniasm
## Dataset: lr-synth
## Uses this dataset: 
## Analyzer: Busco

busco --auto-lineage -c 12 -m genome -i data/process/miniasm/lr-synth/polished_assembly_minimap_lr-synth.fa -o data/process/miniasm/lr-synth/busco

