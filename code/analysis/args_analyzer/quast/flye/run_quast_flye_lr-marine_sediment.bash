#!/bin/bash
## Analyzer: metaquast
## Assembler: flye
## Dataset: lr-marine_sediment


conda run -n ana_metaquast bash code/analysis/quast/flye/scripts/quast_flye_lr-marine_sediment.bash | tee logs/analysis/log_quast_flye_lr-marine_sediment.log
