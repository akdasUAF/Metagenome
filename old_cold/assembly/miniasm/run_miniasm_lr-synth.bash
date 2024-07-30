#!/bin/bash
## Assembler: Miniasm
## Dataset: Long Read Synth

conda run -n asm_miniasm bash code/assembly/miniasm/scripts/miniasm_lr-synth.bash | tee logs/assembly/log_assemble_miniasm_lr-synth.log

# conda run -n pro_python bash code/processing/gfa_to_fa.py data/process/miniasm/lr-synth/assembly_minimap_lr-synth.gfa | tee logs/processing/log_gfa_to_fa_miniasm_lr-synth.log