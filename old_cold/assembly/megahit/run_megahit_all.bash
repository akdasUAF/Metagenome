#!/bin/bash
## Assembler: megahit

## sr-bsc
bash code/assembly/megahit/run_megahit_sr-bsc.bash || echo "Megahit sr-bsc: Failed" | tee -a logs/assembly/log_assemble_megahit_sr-bsc.log
## sr-diabetes
bash code/assembly/megahit/run_megahit_sr-diabetes.bash || echo "Megahit sr-diabetes: Failed" | tee -a logs/assembly/log_assemble_megahit_sr-diabetes.log
## sr-gut
bash code/assembly/megahit/run_megahit_sr-gut.bash || echo "megahit sr-gut: Failed" | tee -a logs/assembly/log_assemble_megahit_sr-gut.log
## sr-marine_sediment
bash code/assembly/megahit/run_megahit_sr-marine_sediment.bash || echo "Megahit sr-marine_sediment: Failed" | tee -a logs/assembly/log_assemble_megahit_sr-marine_sediment.log

