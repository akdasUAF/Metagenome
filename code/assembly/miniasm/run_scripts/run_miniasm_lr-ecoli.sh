#!/bin/bash

## Assembler: miniasm
## Dataset: lr-ecoli

mkdir -p data/analysis/miniasm/lr-ecoli/
bash code/analysis/dool/start_dool.sh data/analysis/miniasm/lr-ecoli/dool_asm_miniasm_lr-ecoli

conda run -n asm_miniasm bash code/assembly/miniasm/miniasm_lr-ecoli.sh | tee data/analysis/miniasm/lr-ecoli/log_assemble_miniasm_lr-ecoli.log

bash code/analysis/dool/kill_dool.sh
