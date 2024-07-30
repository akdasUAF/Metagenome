#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Raven
## Dataset: lr-soil
## Uses this dataset: 
## Analyzer: Busco


busco --auto-lineage -c 12 -m genome -i data/MAG/raven/lr-synth/assembly_raven_lr-synth.fasta -o data/process/raven/lr-synth/busco/
