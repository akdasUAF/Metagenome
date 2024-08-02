#!/bin/bash

## Assembler: flye
## Dataset: lr-gut

mkdir -p data/analysis/flye/lr-gut/
bash code/analysis/dool/start_dool.sh data/analysis/flye/lr-gut/dool_asm_flye_lr-gut.csv

conda run -n asm_flye bash code/assembly/flye/flye_lr-gut.sh | tee data/analysis/flye/lr-gut/log_assemble_flye_lr-gut.log

bash code/analysis/dool/kill_dool.sh
