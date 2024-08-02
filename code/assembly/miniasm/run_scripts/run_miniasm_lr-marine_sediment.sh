#!/bin/bash

## Assembler: miniasm
## Dataset: lr-marine_sediment

mkdir -p data/analysis/miniasm/lr-marine_sediment/
bash code/analysis/dool/start_dool.sh data/analysis/miniasm/lr-marine_sediment/dool_asm_miniasm_lr-marine_sediment

conda run -n asm_miniasm bash code/assembly/miniasm/miniasm_lr-marine_sediment.sh | tee data/analysis/miniasm/lr-marine_sediment/log_assemble_miniasm_lr-marine_sediment.log

bash code/analysis/dool/kill_dool.sh
