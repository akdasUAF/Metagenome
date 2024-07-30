#!/bin/bash
## Assembler: IDBA
## Dataset: Short read

conda run -n asm_idba bash code/assembly/idba/scripts/idba_sr-gut.bash | tee logs/assembly/log_assemble_idba_sr-gut.log
