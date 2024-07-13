#!/bin/bash
## Assembler: Miniasm
## Dataset: Long Read Soil 

conda run -n asm_miniasm bash code/assembly/miniasm/scripts/miniasm_lr-soil.bash | tee logs/assembly/log_assemble_miniasm_lr-soil.log
conda run -n pro_python bash code/processing/gfa_to_fa.py data/process/miniasm/lr-soil/assembly_minimap_lr-soil.gfa | tee logs/processing/log_gfa_to_fa_miniasm_lr-soil.log