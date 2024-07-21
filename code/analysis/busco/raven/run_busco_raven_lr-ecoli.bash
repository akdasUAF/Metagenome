#!/bin/bash
## Analyzer: Busco
## Assembler: Raven
## Dataset: Long read Ecoli


conda run -n ana_busco bash code/analysis/busco/raven/scripts/busco_raven_lr-ecoli.bash | tee logs/analysis/log_busco_raven_lr-ecoli.log
