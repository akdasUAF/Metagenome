#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Canu
## Dataset: Long read Soil
## Uses this dataset: 
## Analyzer: busco

mkdir data/process/canu/lr-synth/busco
busco --auto-lineage -m genome -i data/process/canu/lr-synth/lr-synth.contigs.fasta -o data/process/canu/lr-synth/busco
