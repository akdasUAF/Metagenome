#!/bin/bash
## Assembler: Canu
## Dataset: Long read Ecoli


time {

conda run -n asm_canu bash code/assembly/canu/scripts/canu_lr-ecoli.bash | tee logs/assembly/log_assemble_canu_lr-ecoli.log

} | tee -a logs/assembly/log_assemble_canu_lr-ecoli.log