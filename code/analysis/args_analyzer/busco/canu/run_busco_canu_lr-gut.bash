#!/bin/bash
## Analyzer: Busco
## Assembler: Canu
## Dataset: Long read Gut


conda run -n ana_busco bash code/analysis/busco/canu/scripts/busco_canu_lr-gut.bash | tee logs/analysis/log_busco_canu_lr-gut.log
