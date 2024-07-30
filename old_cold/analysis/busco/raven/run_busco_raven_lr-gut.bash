#!/bin/bash
## Analyzer: Busco
## Assembler: Raven
## Dataset: lr-gut


conda run -n ana_busco bash code/analysis/busco/raven/scripts/busco_raven_lr-gut.bash | tee logs/analysis/log_busco_raven_lr-gut.log
