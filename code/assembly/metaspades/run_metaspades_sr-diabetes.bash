#!/bin/bash
## Assembler: Metaspades
## Dataset: Short read diabetes

conda run -n asm_metaspades bash code/assembly/metaspades/scripts/metaspades_sr-diabetes.bash | tee logs/assembly/log_assemble_metaspades_sr-diabetes.log
