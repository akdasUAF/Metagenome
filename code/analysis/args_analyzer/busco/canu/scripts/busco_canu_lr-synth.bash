#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Canu
## Dataset: Long read Soil
## Uses this dataset: 
## Analyzer: busco

busco --auto-lineage -c 12 -m genome -i data/MAG/canu/lr-synth/lr-synth.contigs.fasta -o data/process/canu/lr-synth/busco
