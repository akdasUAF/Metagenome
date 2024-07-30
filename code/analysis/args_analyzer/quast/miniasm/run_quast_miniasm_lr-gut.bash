#!/bin/bash
## Analyzer: metaquast
## Assembler: miniasm
## Dataset: lr-gut


conda run -n ana_metaquast bash code/analysis/quast/miniasm/scripts/quast_miniasm_lr-gut.bash | tee logs/analysis/log_quast_miniasm_lr-gut.log
