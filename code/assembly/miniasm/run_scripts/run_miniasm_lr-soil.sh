#!/bin/bash

## Assembler: miniasm
## Dataset: lr-soil

mkdir -p data/analysis/miniasm/lr-soil/
bash code/analysis/dool/start_dool.sh data/analysis/miniasm/lr-soil/dool_asm_miniasm_lr-soil

conda run -n asm_miniasm bash code/assembly/miniasm/miniasm_lr-soil.sh | tee data/analysis/miniasm/lr-soil/log_assemble_miniasm_lr-soil.log

bash code/analysis/dool/kill_dool.sh
