#!/bin/bash
## Assembler: Metaspades
## Dataset: Short read Marine Sediment

conda run -n asm_metaspades bash code/assembly/metaspades/scripts/metaspades_sr-marine_sediment.bash | tee logs/assembly/log_assemble_metaspades_sr-marine_sediment.log
