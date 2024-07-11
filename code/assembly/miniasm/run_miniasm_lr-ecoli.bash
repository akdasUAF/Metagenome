#!/bin/bash
## Assembler: Miniasm
## Dataset: Long Read Ecoli

conda run -n asm_miniasm bash code/assembly/miniasm/scripts/miniasm_lr-ecoli.bash | tee logs/assembly/log_assemble_miniasm_lr-ecoli.log
