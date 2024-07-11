#!/bin/bash
## Assembler: Metaspades
## Dataset: Short read Soil

conda run -n asm_metaspades bash code/assembly/metaspades/scripts/metaspades_sr-soil.bash | tee logs/assembly/log_assemble_metaspades_sr-soil.log
