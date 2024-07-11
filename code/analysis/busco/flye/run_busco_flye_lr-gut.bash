#!/bin/bash
## Analyzer: Busco
## Assembler: Flye
## Dataset: Long read gut


conda run -n ana_busco bash code/analysis/busco/flye/scripts/busco_flye_lr-gut.bash | tee logs/analysis/log_busco_flye_lr-gut.log
