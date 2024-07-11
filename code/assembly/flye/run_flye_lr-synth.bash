#!/bin/bash
## Assembler: flye
## Dataset: Long read synth

conda run -n asm_flye bash code/assembly/flye/scripts/flye_lr-synth.bash | tee logs/assembly/log_assemble_flye_lr-synth.log
