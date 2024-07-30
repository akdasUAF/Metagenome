#!/bin/bash
## Assembler: Metaspades
## Dataset: Short read BSC

conda run -n asm_metaspades bash code/assembly/metaspades/scripts/metaspades_sr-bsc.bash | tee logs/assembly/log_assemble_metaspades_sr-bsc.log
