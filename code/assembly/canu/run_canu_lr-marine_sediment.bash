#!/bin/bash
## Assembler: canu
## Dataset: Long read Marine Sediment

conda run -n asm_canu bash code/assembly/canu/scripts/canu_lr-marine_sediment.bash | tee logs/assembly/log_assemble_canu_lr-marine_sediment.log
