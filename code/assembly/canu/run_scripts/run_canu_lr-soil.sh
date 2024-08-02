#!/bin/bash

## Assembler: canu
## Dataset: lr-soil

mkdir -p data/analysis/canu/lr-soil/
bash code/analysis/dool/start_dool.sh data/analysis/canu/lr-soil/dool_asm_canu_lr-soil.csv

conda run -n asm_canu bash code/assembly/canu/canu_lr-soil.sh | tee data/analysis/canu/lr-soil/log_assemble_canu_lr-soil.log

bash code/analysis/dool/kill_dool.sh
