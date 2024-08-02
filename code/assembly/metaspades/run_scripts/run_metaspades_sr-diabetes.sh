#!/bin/bash

## Assembler: metaspades
## Dataset: sr-diabetes

mkdir -p data/analysis/metaspades/sr-diabetes/
bash code/analysis/dool/start_dool.sh data/analysis/metaspades/sr-diabetes/dool_asm_metaspades_sr-diabetes
conda run -n asm_metaspades bash code/assembly/metaspades/metaspades_sr-diabetes.sh | tee data/analysis/metaspades/sr-diabetes/log_assemble_metaspades_sr-diabetes.log

bash code/analysis/dool/kill_dool.sh
