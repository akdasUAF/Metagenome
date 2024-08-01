#!/bin/bash

## Assembler: metaspades
## Dataset: sr-bsc

mkdir -p data/analysis/metaspades/sr-bsc/
bash code/analysis/dool/start_dool.sh data/analysis/metaspades/sr-bsc/dool_asm_metaspades_sr-bsc.csv

conda run -n asm_metaspades bash code/assembly/metaspades/metaspades_sr-bsc.sh | tee data/analysis/metaspades/sr-bsc/log_assemble_metaspades_sr-bsc.log

bash code/analysis/dool/kill_dool.sh
