#!/bin/bash
## Analyzer: Busco
## Assembler: Raven
## Dataset: lr-soil


conda run -n ana_busco bash code/analysis/busco/miniasm/scripts/busco_miniasm_lr-soil.bash | tee logs/analysis/log_busco_miniasm_lr-soil.log

