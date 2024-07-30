#!/bin/bash
## Assembler: Megahit
## Dataset: Short read BSC

conda run -n asm_megahit bash code/assembly/megahit/scripts/megahit_sr-marine_sediment.bash | tee logs/assembly/log_assemble_megahit_sr-marine_sediment.log
