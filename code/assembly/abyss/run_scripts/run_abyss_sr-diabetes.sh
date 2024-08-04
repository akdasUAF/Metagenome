#!/bin/bash

## Assembler: abyss
## Dataset: sr-diabetes

bash code/analysis/dool/start_dool.sh data/analysis/abyss/sr-diabetes/dool_asm_abyss_sr-diabetes.csv

conda run -n asm_abyss bash -c "source code/analysis/time/run_with_time.sh code/assembly/abyss/abyss_sr-diabetes.sh" | tee data/analysis/abyss/sr-diabetes/log_assemble_abyss_sr-diabetes.log

bash code/analysis/dool/kill_dool.sh
