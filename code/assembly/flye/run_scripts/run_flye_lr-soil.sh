#!/bin/bash

## Assembler: flye
## Dataset: lr-soil

mkdir -p data/analysis/flye/lr-soil/
bash code/analysis/dool/start_dool.sh data/analysis/flye/lr-soil/dool_asm_flye_lr-soil.csv

conda run -n asm_flye bash -c "source code/analysis/time/run_with_time.sh code/assembly/flye/flye_lr-soil.sh" | tee data/analysis/flye/lr-soil/log_assemble_flye_lr-soil.log

bash code/analysis/dool/kill_dool.sh
