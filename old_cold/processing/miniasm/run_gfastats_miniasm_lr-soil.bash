#!/bin/bash
## Processing: gfastats
## Assembler: miniasm
## Dataset: lr-soil

conda run -n pro_gfastats bash code/processing/miniasm/scripts/gfastats_miniasm_lr-soil.bash | tee logs/processing/log_gfastats_miniasm_lr-soil.log
