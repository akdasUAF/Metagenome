#!/bin/bash

## Script to analyze the quality of the metagenomes
## Analyzer: METAQUAST
## Assembler: Abyss
## Dataset: Short read BSC
## Uses this dataset: 

conda run -n asm_metaquast bash code/analysis/quast/abyss/scripts/quast_abyss_sr-bsc.bash | tee logs/quast/log_quast_abyss_sr-bsc.log

