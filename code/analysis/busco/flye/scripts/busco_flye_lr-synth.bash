#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Flye
## Dataset: Long read Synth
## Uses this dataset: 
## Analyzer: Busco

mkdir data/process/flye/lr-synth/busco

busco --auto-lineage -c 12 -m genome -i data/process/flye/lr-synth/assembly.fasta -o data/process/flye/lr-synth/busco

