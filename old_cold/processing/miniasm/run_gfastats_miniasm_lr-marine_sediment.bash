#!/bin/bash
## Processing: gfastats
## Assembler: miniasm
## Dataset: lr-marine_sediment

conda run -n pro_gfastats bash code/processing/miniasm/scripts/gfastats_miniasm_lr-marine_sediment.bash | tee logs/processing/log_gfastats_miniasm_lr-marine_sediment.log
