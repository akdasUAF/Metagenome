#!/bin/bash
## Assembler: metaspades

## sr-bsc
bash code/assembly/metaspades/run_metaspades_sr-bsc.bash || echo "metaspades sr-bsc Failed" | tee -a logs/assembly/log_assemble_metaspades_sr-bsc.log
## sr-diabetes
bash code/assembly/metaspades/run_metaspades_sr-diabetes.bash || echo "metaspades sr-diabetes: Failed" | tee -a logs/assembly/log_assemble_metaspades_sr-diabetes.log
## sr-gut
bash code/assembly/metaspades/run_metaspades_sr-gut.bash || echo "metaspades sr-gut: Failed" | tee -a logs/assembly/log_assemble_metaspades_sr-gut.log
## sr-marine_sediment
bash code/assembly/metaspades/run_metaspades_sr-marine_sediment.bash || echo "metaspades sr-marine_sediment Failed" | tee -a logs/assembly/log_assemble_metaspades_sr-marine_sediment.log

