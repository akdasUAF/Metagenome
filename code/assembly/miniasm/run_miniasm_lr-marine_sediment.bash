#!/bin/bash
## Assembler: Miniasm
## Dataset: Long Read 

conda run -n asm_miniasm bash code/assembly/miniasm/scripts/miniasm_lr-marine_sediment.bash | tee logs/assembly/log_assemble_miniasm_lr-marine_sediment.log
