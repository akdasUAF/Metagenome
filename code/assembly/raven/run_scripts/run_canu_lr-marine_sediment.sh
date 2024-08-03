#!/bin/bash

## Assembler: raven
## Dataset: lr-marine_sediment

mkdir -p data/analysis/raven/lr-marine_sediment/
bash code/analysis/dool/start_dool.sh data/analysis/raven/lr-marine_sediment/dool_asm_raven_lr-marine_sediment.csv

conda run -n asm_raven bash code/assembly/raven/raven_lr-marine_sediment.sh | tee data/analysis/raven/lr-marine_sediment/log_assemble_raven_lr-marine_sediment.log

bash code/analysis/dool/kill_dool.sh
