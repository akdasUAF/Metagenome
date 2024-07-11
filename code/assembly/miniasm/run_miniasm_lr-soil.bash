#!/bin/bash
## Assembler: Miniasm
## Dataset: Long Read Soil 

conda run -n asm_miniasm bash code/assembly/miniasm/scripts/miniasm_lr-soil.bash | tee logs/assembly/log_assemble_miniasm_lr-soil.log
