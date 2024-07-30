#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Flye
## Dataset: Long read Synth
## Uses this dataset: 
## Analyzer: Busco

busco --auto-lineage -c 12 -m genome -i data/MAG/flye/lr-synth/assembly.fasta -o data/process/flye/lr-synth/busco

