#!/bin/bash
## Assembler: Abyss
## Dataset: Short read Gut

conda run -n asm_abyss bash code/assembly/abyss/scripts/abyss_sr-gut.bash | tee logs/assembly/log_assemble_abyss_sr-gut.log
