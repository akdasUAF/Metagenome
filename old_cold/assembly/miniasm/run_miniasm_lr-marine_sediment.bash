#!/bin/bash
## Assembler: Miniasm
## Dataset: Long Read 

conda run -n asm_miniasm bash code/assembly/miniasm/scripts/miniasm_lr-marine_sediment.bash | tee logs/assembly/log_assemble_miniasm_lr-marine_sediment.log

# conda run -n pro_python bash code/processing/gfa_to_fa.py data/process/miniasm/lr-marine_sediment/assembly_minimap_lr-marine_sediment.gfa | tee logs/processing/log_gfa_to_fa_miniasm_lr-marine_sediment.log