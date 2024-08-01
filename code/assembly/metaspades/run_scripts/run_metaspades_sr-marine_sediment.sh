#!/bin/bash

## Assembler: metaspades
## Dataset: sr-marine_sediment

mkdir -p data/analysis/metaspades/sr-marine_sediment/
bash code/analysis/dool/start_dool.sh data/analysis/metaspades/dool_asm_metaspades_sr-marine_sediment.csv

conda run -n asm_metaspades bash code/assembly/metaspades/metaspades_sr-marine_sediment.sh | tee data/analysis/metaspades/sr-marine_sediment/log_assemble_metaspades_sr-marine_sediment.log

bash code/analysis/dool/kill_dool.sh
