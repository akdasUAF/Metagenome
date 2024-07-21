#!/bin/bash
## Analyzer: metaquast
## Assembler: flye
## Dataset: lr-ecoli


conda run -n ana_metaquast bash code/analysis/quast/flye/scripts/quast_flye_lr-ecoli.bash | tee logs/analysis/log_quast_flye_lr-ecoli.log
