#!/bin/bash
## Assembler: IDBA
## Dataset: Short read BSC

conda run -n asm_idba bash code/assembly/idba/scripts/idba_sr-bsc.bash | tee logs/assembly/log_assemble_idba_sr-bsc.log
