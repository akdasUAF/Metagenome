#!/bin/bash
## Assembler: flye
## Dataset: Long read Ecoli

conda run -n asm_flye bash code/assembly/flye/scripts/flye_lr-ecoli.bash | tee logs/assembly/log_assemble_flye_lr-ecoli.log

