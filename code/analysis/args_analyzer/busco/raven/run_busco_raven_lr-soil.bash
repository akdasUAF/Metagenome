#!/bin/bash
## Analyzer: Busco
## Assembler: Raven
## Dataset: lr-soil


conda run -n ana_busco bash code/analysis/busco/raven/scripts/busco_raven_lr-soil.bash | tee logs/analysis/log_busco_raven_lr-soil.log
