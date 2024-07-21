#!/bin/bash
## Analyzer: metaquast
## Assembler: miniasm
## Dataset: lr-ecoli


conda run -n ana_metaquast bash code/analysis/quast/miniasm/scripts/quast_miniasm_lr-ecoli.bash | tee logs/analysis/log_quast_miniasm_lr-ecoli.log
