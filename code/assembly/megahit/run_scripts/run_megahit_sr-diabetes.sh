#!/bin/bash

## Assembler: abyss
## Dataset: sr-diabetes

bash code/analysis/dool/start_dool.sh data/analysis/abyss/dool_asm_abyss_sr-diabetes.csv

conda run -n asm_abyss bash code/assembly/abyss/abyss_sr-diabetes.sh | tee data/analysis/abyss/sr-diabetes/log_assemble_abyss_sr-diabetes.log

bash code/analysis/dool/kill_dool.sh
