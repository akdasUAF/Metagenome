#!/bin/bash

## Assembler: flye
## Dataset: lr-marine_sediment

mkdir -p data/analysis/flye/lr-marine_sediment/
bash code/analysis/dool/start_dool.sh data/analysis/flye/lr-marine_sediment/dool_asm_flye_lr-marine_sediment.csv

conda run -n asm_flye bash code/assembly/flye/flye_lr-marine_sediment.sh | tee data/analysis/flye/lr-marine_sediment/log_assemble_flye_lr-marine_sediment.log

bash code/analysis/dool/kill_dool.sh
