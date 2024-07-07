#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Megahit
## Dataset: Short read Marine Sediment
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir -p data/process/megahit/sr-marine_sediment/asm_sr-marine_sediment_SRR27456520.megahit_asm/quast
python3 tools/analysis/quast/metaquast.py -o  data/process/megahit/sr-marine_sediment/asm_sr-marine_sediment_SRR27456520.megahit_asm/quast data/process/megahit/sr-marine_sediment/asm_sr-marine_sediment_SRR27456520.megahit_asm/final.contigs.fa

