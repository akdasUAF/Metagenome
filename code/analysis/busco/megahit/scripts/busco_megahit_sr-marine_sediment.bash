#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Megahit
## Dataset: Short read Marine Sediment
## Uses this dataset: 
## Analyzer: Busco

busco --auto-lineage -m genome -i data/process/megahit/sr-marine_sediment/assembly.fasta -o data/process/megahit/sr-marine_sediment/busco

