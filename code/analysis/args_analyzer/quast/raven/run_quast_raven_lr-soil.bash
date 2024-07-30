#!/bin/bash
## Analyzer: metaquast
## Assembler: raven
## Dataset: lr-soil


conda run -n ana_metaquast bash code/analysis/quast/raven/scripts/quast_raven_lr-soil.bash | tee logs/analysis/log_quast_raven_lr-soil.log
