#!/bin/bash

## Assembler: raven
## Dataset: lr-soil

mkdir -p data/analysis/raven/lr-soil/
bash code/analysis/dool/start_dool.sh data/analysis/raven/lr-soil/dool_asm_raven_lr-soil.csv

conda run -n asm_raven bash -c "source code/analysis/time/run_with_time.sh code/assembly/raven/raven_lr-soil.sh" | tee data/analysis/raven/lr-soil/log_assemble_raven_lr-soil.log
bash code/analysis/dool/kill_dool.sh
