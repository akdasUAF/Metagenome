#!/bin/bash
## Assembler: Miniasm
## Dataset: Long Read Ecoli

conda run -n asm_miniasm bash code/assembly/miniasm/scripts/miniasm_lr-ecoli.bash | tee logs/assembly/log_assemble_miniasm_lr-ecoli.log

# conda run -n pro_python python3 old_code_2/processing/gfa_to_fa.py data/process/miniasm/lr-ecoli/assembly_minimap_lr-ecoli.gfa data/process/miniasm/lr-ecoli/assembly_minimap_lr-ecoli.fa | tee logs/processing/log_gfa_to_fa_miniasm_lr-ecoli.log