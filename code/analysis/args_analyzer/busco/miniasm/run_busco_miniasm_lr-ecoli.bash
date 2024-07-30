#!/bin/bash
## Analyzer: Busco
## Assembler: Raven
## Dataset: lr-ecoli


conda run -n ana_busco bash code/analysis/busco/miniasm/scripts/busco_miniasm_lr-ecoli.bash | tee logs/analysis/log_busco_miniasm_lr-ecoli.log
