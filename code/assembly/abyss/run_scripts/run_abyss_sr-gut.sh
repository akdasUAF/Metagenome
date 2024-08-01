#!/bin/bash

## Assembler: abyss
## Dataset: sr-gut

bash code/analysis/dool/start_dool.sh data/analysis/abyss/sr-gut/dool_asm_abyss_sr-gut.csv

conda run -n asm_abyss bash code/assembly/abyss/abyss_sr-gut.sh | tee data/analysis/abyss/sr-gut/log_assemble_abyss_sr-gut.log

bash code/analysis/dool/kill_dool.sh
