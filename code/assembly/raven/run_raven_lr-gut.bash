#!/bin/bash
## Assembler: Raven
## Dataset: Long Read Gut

conda run -n asm_raven bash code/assembly/raven/scripts/raven_lr-gut.bash | tee logs/assembly/log_assemble_raven_lr-gut.log
