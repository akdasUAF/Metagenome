#!/bin/bash
## Analyzer: Busco
## Assembler: Raven
## Dataset: lr-synth


conda run -n ana_busco bash code/analysis/busco/raven/scripts/busco_raven_lr-synth.bash | tee logs/analysis/log_busco_raven_lr-synth.log
