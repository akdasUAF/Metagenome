#!/bin/bash
## Analyzer: metaquast
## Assembler: miniasm
## Dataset: lr-marine_sediment


conda run -n ana_metaquast bash code/analysis/quast/miniasm/scripts/quast_miniasm_lr-marine_sediment.bash | tee logs/analysis/log_quast_miniasm_lr-marine_sediment.log
