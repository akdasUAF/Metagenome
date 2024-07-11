#!/bin/bash
## Assembler: flye
## Dataset: Long read gut

conda run -n asm_flye bash code/assembly/flye/scripts/flye_lr-gut.bash | tee logs/assembly/log_assemble_flye_lr-gut.log
