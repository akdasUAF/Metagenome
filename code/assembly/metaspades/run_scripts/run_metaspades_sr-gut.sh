#!/bin/bash

## Assembler: metaspades
## Dataset: sr-gut

bash code/analysis/dool/start_dool.sh data/analysis/metaspades/dool_asm_metaspades_sr-gut.csv

conda run -n asm_metaspades bash code/assembly/metaspades/metaspades_sr-gut.sh | tee data/analysis/metaspades/sr-gut/log_assemble_metaspades_sr-gut.log

bash code/analysis/dool/kill_dool.sh
