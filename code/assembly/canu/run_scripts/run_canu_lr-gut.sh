#!/bin/bash

## Assembler: canu
## Dataset: lr-gut

mkdir -p data/analysis/canu/lr-gut/
bash code/analysis/dool/start_dool.sh data/analysis/canu/dool_asm_canu_lr-gut.csv

conda run -n asm_canu bash code/assembly/canu/canu_lr-gut.sh | tee data/analysis/canu/lr-gut/log_assemble_canu_lr-gut.log

bash code/analysis/dool/kill_dool.sh
