#!/bin/bash

## Assembler: abyss
## Dataset: sr-marine_sediment

bash code/analysis/dool/start_dool.sh data/analysis/abyss/sr-abyss/dool_asm_abyss_sr-marine_sediment.csv

conda run -n asm_abyss bash code/assembly/abyss/abyss_sr-marine_sediment.sh | tee data/analysis/abyss/sr-marine_sediment/log_assemble_abyss_sr-marine_sediment.log

bash code/analysis/dool/kill_dool.sh
