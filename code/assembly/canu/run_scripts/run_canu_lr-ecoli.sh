#!/bin/bash

## Assembler: canu
## Dataset: lr-ecoli

mkdir -p data/analysis/canu/lr-ecoli/
bash code/analysis/dool/start_dool.sh data/analysis/canu/dool_asm_canu_lr-ecoli.csv

conda run -n asm_canu bash code/assembly/canu/canu_lr-ecoli.sh | tee data/analysis/canu/lr-ecoli/log_assemble_canu_lr-ecoli.log

bash code/analysis/dool/kill_dool.sh
