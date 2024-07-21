#!/bin/bash
## Processing: gfastats
## Assembler: miniasm
## Dataset: lr-synth

conda run -n pro_gfastats bash code/processing/miniasm/scripts/gfastats_miniasm_lr-synth.bash | tee logs/processing/log_gfastats_miniasm_lr-synth.log
