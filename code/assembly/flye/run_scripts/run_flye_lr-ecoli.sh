#!/bin/bash

## Assembler: flye
## Dataset: lr-ecoli

mkdir -p data/analysis/flye/lr-ecoli/
bash code/analysis/dool/start_dool.sh data/analysis/flye/lr-ecoli/dool_asm_flye_lr-ecoli.csv

conda run -n asm_flye bash code/assembly/flye/flye_lr-ecoli.sh | tee data/analysis/flye/lr-ecoli/log_assemble_flye_lr-ecoli.log

bash code/analysis/dool/kill_dool.sh
