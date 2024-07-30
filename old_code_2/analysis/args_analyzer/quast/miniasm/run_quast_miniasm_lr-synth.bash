#!/bin/bash
## Analyzer: metaquast
## Assembler: miniasm
## Dataset: lr-synth


conda run -n ana_metaquast bash code/analysis/quast/miniasm/scripts/quast_miniasm_lr-synth.bash | tee logs/analysis/log_quast_miniasm_lr-synth.log
