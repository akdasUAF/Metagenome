#!/bin/bash
## Assembler: Miniasm
## Dataset: Long Read 

conda run -n asm_miniasm bash code/assembly/miniasm/scripts/miniasm_lr-gut.bash | tee logs/assembly/log_assemble_miniasm_lr-gut.log

# conda run -n pro_python bash code/processing/gfa_to_fa.py data/process/miniasm/lr-gut/assembly_minimap_lr-gut.gfa | tee logs/processing/log_gfa_to_fa_miniasm_lr-gut.log