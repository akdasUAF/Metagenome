#!/bin/bash
## Assembler: Abyss
## Dataset: Short read Marine Sediment

conda run -n asm_abyss bash code/assembly/abyss/scripts/abyss_sr-marine_sediment.bash | tee logs/assembly/log_assemble_abyss_sr-marine_sediment.log
