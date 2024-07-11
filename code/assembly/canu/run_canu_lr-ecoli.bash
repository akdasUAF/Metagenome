#!/bin/bash
## Assembler: Canu
## Dataset: Long read Ecoli

conda run -n asm_canu bash code/assembly/canu/scripts/canu_lr-ecoli.bash | tee logs/assembly/log_assemble_canu_lr-ecoli.log
