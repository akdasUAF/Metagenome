#!/bin/bash
## Analyzer: Busco
## Assembler: Flye
## Dataset: Long read


conda run -n ana_busco bash code/analysis/busco/flye/scripts/busco_flye_lr-soil.bash | tee logs/analysis/log_busco_flye_lr-soil.log
