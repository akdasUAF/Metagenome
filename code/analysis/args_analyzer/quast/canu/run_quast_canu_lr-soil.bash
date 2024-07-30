#!/bin/bash
## Analyzer: metaquast
## Assembler: canu
## Dataset: lr-soil


conda run -n ana_metaquast bash code/analysis/quast/canu/scripts/quast_canu_lr-soil.bash | tee logs/analysis/log_quast_canu_lr-soil.log
