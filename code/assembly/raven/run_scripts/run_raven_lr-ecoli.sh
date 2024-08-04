#!/bin/bash

## Assembler: raven
## Dataset: lr-ecoli

mkdir -p data/analysis/raven/lr-ecoli/
bash code/analysis/dool/start_dool.sh data/analysis/raven/lr-ecoli/dool_asm_raven_lr-ecoli.csv

conda run -n asm_raven bash -c "source code/analysis/time/run_with_time.sh code/assembly/raven/raven_lr-ecoli.sh" | tee data/analysis/raven/lr-ecoli/log_assemble_raven_lr-ecoli.log
bash code/analysis/dool/kill_dool.sh
