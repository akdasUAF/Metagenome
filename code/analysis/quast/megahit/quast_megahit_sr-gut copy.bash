#!/bin/bash

## Script to analyze the quality of the metagenomes
## Assembler: Megahit
## Dataset: Short read Gut
## Uses this dataset: 
## Analyzer: METAQUAST

mkdir -p data/process/megahit/sr-gut/asm_sr-gut_SRR18491254.megahit_asm/quast
python3 tools/analysis/quast/metaquast.py -o data/process/megahit/sr-gut/asm_sr-gut_SRR18491254.megahit_asm/quast/ data/process/megahit/sr-gut/asm_sr-gut_SRR18491254.megahit_asm/final.contigs.fa

 -r data/reference/