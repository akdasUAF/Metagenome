#!/bin/bash

## Assembler: raven
## Dataset: lr-gut

mkdir -p data/analysis/raven/lr-gut/
bash code/analysis/dool/start_dool.sh data/analysis/raven/lr-gut/dool_asm_raven_lr-gut.csv

conda run -n asm_raven bash -c "source code/analysis/time/run_with_time.sh code/assembly/raven/raven_lr-gut.sh" | tee data/analysis/raven/lr-gut/log_assemble_raven_lr-gut.log
bash code/analysis/dool/kill_dool.sh
