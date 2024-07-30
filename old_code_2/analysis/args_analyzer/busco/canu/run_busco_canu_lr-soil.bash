#!/bin/bash
## Analyzer: Busco
## Assembler: Canu
## Dataset: Long read Soil


conda run -n ana_busco bash code/analysis/busco/canu/scripts/busco_canu_lr-soil.bash | tee logs/analysis/log_busco_canu_lr-soil.log
