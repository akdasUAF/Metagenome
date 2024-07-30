#!/bin/bash
## Analyzer: metaquast
## Assembler: raven
## Dataset: lr-synth


conda run -n ana_metaquast bash code/analysis/quast/raven/scripts/quast_raven_lr-synth.bash | tee logs/analysis/log_quast_raven_lr-synth.log
