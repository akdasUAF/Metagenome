#!/bin/bash

## Assembler: canu
## Dataset: lr-marine_sediment

mkdir -p data/analysis/canu/lr-marine_sediment/
bash code/analysis/dool/start_dool.sh data/analysis/canu/lr-marine_sediment/dool_asm_canu_lr-marine_sediment.csv

conda run -n asm_canu bash -c "source code/analysis/time/run_with_time.sh code/assembly/canu/canu_lr-marine_sediment.sh" | tee data/analysis/canu/lr-marine_sediment/log_assemble_canu_lr-marine_sediment.log

bash code/analysis/dool/kill_dool.sh
