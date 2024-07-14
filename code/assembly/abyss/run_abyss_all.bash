#!/bin/bash
## Assembler: Abyss

## sr-bsc
bash code/assembly/abyss/run_abyss_sr-bsc.bash || echo "abyss sr-bsc: Failed" | tee -a logs/assembly/log_assemble_abyss_sr-bsc.log
## sr-diabetes
bash code/assembly/abyss/run_abyss_sr-diabetes.bash || echo "Abyss sr-diabetes: Failed" | tee -a logs/assembly/log_assemble_abyss_sr-bsc.log
## sr-gut
bash code/assembly/abyss/run_abyss_sr-gut.bash || echo "Abyss sr-gut: Failed" | tee -a logs/assembly/log_assemble_abyss_sr-gut.log
## sr-marine_sediment
bash code/assembly/abyss/run_abyss_sr-marine_sediment.bash || echo "Abyss sr-marine_sediment: Failed" | tee -a logs/assembly/log_assemble_abyss_sr-marine_sediment.log

