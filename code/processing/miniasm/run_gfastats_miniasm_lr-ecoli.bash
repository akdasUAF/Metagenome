#!/bin/bash
## Processing: gfastats
## Assembler: miniasm
## Dataset: lr-ecoli

conda run -n pro_gfastats bash code/processing/miniasm/scripts/gfastats_miniasm_lr-ecoli.bash | tee logs/processing/log_gfastats_miniasm_lr-ecoli.log
