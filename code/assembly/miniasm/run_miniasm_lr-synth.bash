#!/bin/bash
## Assembler: Miniasm
## Dataset: Long Read Synth

conda run -n asm_miniasm bash code/assembly/miniasm/scripts/miniasm_lr-synth.bash | tee logs/assembly/log_assemble_miniasm_lr-synth.log
