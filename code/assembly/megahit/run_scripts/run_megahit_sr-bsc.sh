#!/bin/bash

## Assembler: megahit
## Dataset: sr-bsc

mkdir -p data/analysis/megahit/sr-bsc/
bash code/analysis/dool/start_dool.sh data/analysis/megahit/sr-bsc/dool_asm_megahit_sr-bsc.csv

conda run -n asm_megahit bash code/assembly/megahit/megahit_sr-bsc.sh | tee data/analysis/megahit/sr-bsc/log_assemble_megahit_sr-bsc.log

bash code/analysis/dool/kill_dool.sh
