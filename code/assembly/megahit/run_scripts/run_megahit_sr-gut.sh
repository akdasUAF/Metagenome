#!/bin/bash

## Assembler: megahit
## Dataset: sr-gut

mkdir -p data/analysis/megahit/sr-gut/
bash code/analysis/dool/start_dool.sh data/analysis/megahit/sr-gut/dool_asm_megahit_sr-gut.csv

conda run -n asm_megahit bash code/assembly/megahit/megahit_sr-gut.sh | tee data/analysis/megahit/sr-gut/log_assemble_megahit_sr-gut.log

bash code/analysis/dool/kill_dool.sh
