#!/bin/bash
## Analyzer: metaquast
## Assembler: miniasm
## Dataset: lr-soil


conda run -n ana_metaquast bash code/analysis/quast/miniasm/scripts/quast_miniasm_lr-soil.bash | tee logs/analysis/log_quast_miniasm_lr-soil.log
