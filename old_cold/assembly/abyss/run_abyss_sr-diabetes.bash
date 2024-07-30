#!/bin/bash
## Assembler: Abyss
## Dataset: Short read Diabetes

conda run -n asm_abyss bash code/assembly/abyss/scripts/abyss_sr-diabetes.bash | tee logs/assembly/log_assemble_abyss_sr-diabetes.log
