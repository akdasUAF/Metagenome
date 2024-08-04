#!/bin/bash

## Assembler: metaspades
## Dataset: sr-gut

mkdir -p data/analysis/metaspades/sr-gut/
bash code/analysis/dool/start_dool.sh data/analysis/metaspades/sr-gut/dool_asm_metaspades_sr-gut

conda run -n asm_metaspades bash -c "source code/analysis/time/run_with_time.sh code/assembly/metaspades/metaspades_sr-gut.sh" | tee data/analysis/metaspades/sr-gut/log_assemble_metaspades_sr-gut.log

bash code/analysis/dool/kill_dool.sh
