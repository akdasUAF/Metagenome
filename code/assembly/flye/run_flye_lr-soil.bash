#!/bin/bash
## Assembler: flye
## Dataset: Long read soil

conda run -n asm_flye bash code/assembly/flye/scripts/flye_lr-soil.bash | tee logs/assembly/log_assemble_flye_lr-soil.log
