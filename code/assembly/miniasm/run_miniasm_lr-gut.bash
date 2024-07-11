#!/bin/bash
## Assembler: Miniasm
## Dataset: Long Read 

conda run -n asm_miniasm bash code/assembly/miniasm/scripts/miniasm_lr-gut.bash | tee logs/assembly/log_assemble_miniasm_lr-gut.log
