#!/bin/bash
## Analyzer: metaquast
## Assembler: canu
## Dataset: lr-marine_sediment


conda run -n ana_metaquast bash code/analysis/quast/canu/scripts/quast_canu_lr-marine_sediment.bash | tee logs/analysis/log_quast_canu_lr-marine_sediment.log
