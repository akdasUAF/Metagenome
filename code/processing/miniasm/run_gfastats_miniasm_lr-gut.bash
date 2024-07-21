#!/bin/bash
## Processing: gfastats
## Assembler: miniasm
## Dataset: lr-gut

conda run -n pro_gfastats bash code/processing/miniasm/scripts/gfastats_miniasm_lr-gut.bash | tee logs/processing/log_gfastats_miniasm_lr-gut.log
