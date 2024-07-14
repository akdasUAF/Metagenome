#!/bin/bash

## Canu lr-marine
bash code/assembly/canu/run_canu_lr-marine_sediment.bash || echo "Canu lr-marine_sediment: Failed" | tee -a logs/assembly/log_assemble_canu_lr-marine_sediment.log

## Abyss Sr-bsc
bash code/assembly/abyss/run_abyss_sr-bsc.bash || echo "abyss sr-bsc: Failed" | tee -a logs/assembly/log_assemble_abyss_sr-bsc.log

## Metaspades sr-bsc
bash code/assembly/metaspades/run_metaspades_sr-bsc.bash || echo "metaspades sr-bsc Failed" | tee -a logs/assembly/log_assemble_metaspades_sr-bsc.log

## Miniasm lr-gut
bash code/assembly/miniasm/run_miniasm_lr-gut.bash || echo "Miniasm lr-gut: Failed" | tee -a logs/assembly/log_assemble_miniasm_lr-gut.log


#### Raven
## lr-ecoli
bash code/assembly/raven/run_raven_lr-ecoli.bash || echo "Raven lr-ecoli: Failed" | tee -a logs/assembly/log_assemble_raven_lr-ecoli.log
## lr-gut
bash code/assembly/raven/run_raven_lr-gut.bash || echo "Raven lr-gut: Failed" | tee -a logs/assembly/log_assemble_raven_lr-gut.log
## lr-marine_sediment
bash code/assembly/raven/run_raven_lr-marine_sediment.bash || echo "Raven lr-marine_sediment: Failed" | tee -a logs/assembly/log_assemble_raven_lr-marine_sediment.log
## lr-soil
bash code/assembly/raven/run_raven_lr-soil.bash || echo "Raven lr-soil: Failed" | tee -a logs/assembly/log_assemble_raven_lr-soil.log


bash code/analysis/run_all/flye/analyze_flye_lr-soil.bash
