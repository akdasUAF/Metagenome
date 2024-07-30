#!/bin/bash
## Assembler: Raven
## Dataset: Long Read

conda run -n asm_raven bash code/assembly/raven/scripts/raven_lr-soil.bash | tee -a logs/assembly/log_assemble_raven_lr-soil.log
