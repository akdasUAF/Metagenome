#!/bin/bash
## Assembler: Megahit
## Dataset: Short read BSC

conda run -n asm_megahit bash code/assembly/megahit/scripts/megahit_sr-bsc.bash | tee logs/assembly/log_assemble_megahit_sr-bsc.log
