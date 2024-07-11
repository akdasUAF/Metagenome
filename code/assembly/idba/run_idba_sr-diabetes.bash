#!/bin/bash
## Assembler: IDBA
## Dataset: Short read Diabetes

conda run -n asm_idba bash code/assembly/idba/scripts/idba_sr-diabetes.bash | tee logs/assembly/log_assemble_idba_sr-diabetes.log
