#!/bin/bash
## Analyzer: Busco
## Assembler: Raven
## Dataset: lr-gut


conda run -n ana_busco bash code/analysis/busco/miniasm/scripts/busco_miniasm_lr-gut.bash | tee logs/analysis/log_busco_miniasm_lr-ecoli.log
