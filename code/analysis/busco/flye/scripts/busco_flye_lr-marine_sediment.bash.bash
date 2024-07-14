#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: busco
## Dataset: Long Read Marine Sediment
## Uses this dataset: 
## Analyzer: Busco

mkdir data/process/flye/lr-marine_sediment/busco
busco --auto-lineage -c 12 -m genome -i data/process/flye/lr-marine_sediment/assembly.fasta -o data/process/flye/lr-marine_sediment/busco


