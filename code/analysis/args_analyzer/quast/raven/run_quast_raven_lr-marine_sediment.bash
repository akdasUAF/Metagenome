#!/bin/bash
## Analyzer: metaquast
## Assembler: raven
## Dataset: lr-marine_sediment


conda run -n ana_metaquast bash code/analysis/quast/raven/scripts/quast_raven_lr-marine_sediment.bash | tee logs/analysis/log_quast_raven_lr-marine_sediment.log
