#!/bin/bash

## Assembler: abyss
## Dataset: sr-bsc

mkdir -p data/analysis/abyss/sr-bsc/
bash code/analysis/dool/start_dool.sh data/analysis/abyss/sr-bsc/dool_asm_abyss_sr-bsc

conda run -n asm_abyss bash code/assembly/abyss/abyss_sr-bsc.sh | tee data/analysis/abyss/sr-bsc/log_assemble_abyss_sr-bsc.log

bash code/analysis/dool/kill_dool.sh
