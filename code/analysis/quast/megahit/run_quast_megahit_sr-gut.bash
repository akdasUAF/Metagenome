#!/bin/bash
## Analyzer: Megaquast
## Assembler: Megahit
## Dataset: Short Read Gut

conda run -n ana_metaquast bash code/analysis/quast/megahit/scripts/quast_megahit_sr-gut.bash | tee logs/analysis/log_quast_megahit_sr-gut.log

