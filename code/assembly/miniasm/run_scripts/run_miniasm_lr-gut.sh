#!/bin/bash

## Assembler: miniasm
## Dataset: lr-gut

mkdir -p data/analysis/miniasm/lr-gut/
bash code/analysis/dool/start_dool.sh data/analysis/miniasm/sr-bsc/dool_asm_miniasm_lr-gut

conda run -n asm_miniasm bash code/assembly/miniasm/miniasm_lr-gut.sh | tee data/analysis/miniasm/lr-gut/log_assemble_miniasm_lr-gut.log

bash code/analysis/dool/kill_dool.sh
