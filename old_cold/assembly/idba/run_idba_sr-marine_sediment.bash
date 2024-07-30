#!/bin/bash
## Assembler: IDBA
## Dataset: Short read

conda run -n asm_idba bash code/assembly/idba/scripts/idba_sr-marine_sediment.bash | tee logs/assembly/log_assemble_idba_sr-marine_sediment.log
