#!/bin/bash
## Analyzer: Busco
## Assembler: Canu
## Dataset: Long read marine sediment


conda run -n ana_busco bash code/analysis/busco/canu/scripts/busco_canu_lr-marine_sediment.bash | tee logs/analysis/log_busco_canu_lr-marine_sediment.log
