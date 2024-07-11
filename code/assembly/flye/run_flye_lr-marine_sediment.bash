#!/bin/bash
## Assembler: flye
## Dataset: Long read marine_sediment

conda run -n asm_flye bash code/assembly/flye/scripts/flye_lr-marine_sediment.bash | tee logs/assembly/log_assemble_flye_lr-marine_sediment.log
