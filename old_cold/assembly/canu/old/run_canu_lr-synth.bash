#!/bin/bash
## Assembler: canu
## Dataset: Long read 


	conda run -n asm_canu bash code/assembly/canu/scripts/canu_lr-synth.bash | tee logs/assembly/log_assemble_canu_lr-synth.log
