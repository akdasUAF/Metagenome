#!/bin/bash
## Assembler: Megahit
## Dataset: Short read Diabetes

conda run -n asm_megahit bash code/assembly/megahit/scripts/megahit_sr-diabetes.bash | tee logs/assembly/log_assemble_megahit_sr-diabetes.log
