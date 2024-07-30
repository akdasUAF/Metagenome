#!/bin/bash
## Assembler: Megahit
## Dataset: Short read Gut

conda run -n asm_megahit bash code/assembly/megahit/scripts/megahit_sr-gut.bash | tee logs/assembly/log_assemble_megahit_sr-gut.log
