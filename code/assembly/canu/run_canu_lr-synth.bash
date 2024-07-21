#!/bin/bash
## Assembler: canu
## Dataset: Long read 
time {
	conda run -n asm_canu bash code/assembly/canu/scripts/canu_lr-synth.bash | tee logs/assembly/log_assemble_canu_lr-synth.log
} | tee -a logs/assembly/log_assemble_canu_lr-synth.log