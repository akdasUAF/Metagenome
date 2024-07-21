#!/bin/bash
## Assembler: Raven
## Dataset: Long Read Marine Sediment

conda run -n asm_raven bash code/assembly/raven/scripts/raven_lr-marine_sediment.bash | tee -a logs/assembly/log_assemble_raven_lr-marine_sediment.log
