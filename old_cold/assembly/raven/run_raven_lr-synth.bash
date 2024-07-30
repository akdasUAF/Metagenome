#!/bin/bash
## Assembler: Raven
## Dataset: Long Read

conda run -n asm_raven bash code/assembly/raven/scripts/raven_lr-ecoli.bash | tee -a logs/assembly/log_assemble_raven_lr-ecoli.log
