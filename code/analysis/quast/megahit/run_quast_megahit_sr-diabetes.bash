#!/bin/bash
## Analyzer: Megaquast
## Assembler: Megahit
## Dataset: Short Read Diabetes

conda run -n ana_metaquast bash code/analysis/quast/megahit/scripts/quast_megahit_sr-diabetes.bash | tee logs/analysis/log_quast_megahit_sr-diabetes.log

