#!/bin/bash
## Assembler: canu
## Dataset: Long read Soil

conda run -n asm_canu bash code/assembly/canu/scripts/canu_lr-soil.bash | tee logs/assembly/log_assemble_canu_lr-soil.log