#!/bin/bash

## Assembler: megahit
## Dataset: sr-marine_sediment

mkdir -p data/analysis/megahit/sr-marine_sediment/
bash code/analysis/dool/start_dool.sh data/analysis/megahit/sr-marine_sediment/dool_asm_megahit_sr-marine_sediment.csv

conda run -n asm_megahit bash code/assembly/megahit/megahit_sr-marine_sediment.sh | tee data/analysis/megahit/sr-marine_sediment/log_assemble_megahit_sr-marine_sediment.log

bash code/analysis/dool/kill_dool.sh
