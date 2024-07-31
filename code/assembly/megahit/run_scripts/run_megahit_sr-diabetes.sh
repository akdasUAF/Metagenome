#!/bin/bash

## Assembler: megahit
## Dataset: sr-diabetes

bash code/analysis/dool/start_dool.sh data/analysis/megahit/dool_asm_megahit_sr-diabetes.csv

conda run -n asm_megahit bash code/assembly/megahit/megahit_sr-diabetes.sh | tee data/analysis/megahit/sr-diabetes/log_assemble_megahit_sr-diabetes.log

bash code/analysis/dool/kill_dool.sh
