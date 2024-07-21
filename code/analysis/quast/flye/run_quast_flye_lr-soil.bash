#!/bin/bash
## Analyzer: metaquast
## Assembler: flye
## Dataset: lr-soil


conda run -n ana_metaquast bash code/analysis/quast/flye/scripts/quast_flye_lr-soil.bash | tee logs/analysis/log_quast_flye_lr-soil.log
