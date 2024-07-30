#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Megahit
## Dataset: Short read Marine Sediment
## Uses this dataset: 
## Analyzer: Busco

busco --auto-lineage -c 12 -m genome -i data/MAG/megahit/sr-marine_sediment/final.contigs.fa -o data/process/megahit/sr-marine_sediment/busco

