#!/bin/bash
## Assembler: Metaspades
## Dataset: sr-gut

conda run -n asm_metaspades bash code/assembly/metaspades/scripts/metaspades_sr-gut.bash | tee logs/assembly/log_assemble_metaspades_sr-gut.log
