#!/bin/bash
## Assembler: idba

## sr-bsc
bash code/assembly/idba/run_idba_sr-bsc.bash || echo "IDBA-UD sr-bsc: Failed" | tee -a logs/assembly/log_assemble_idba_sr-bsc.log
## sr-diabetes
bash code/assembly/idba/run_idba_sr-diabetes.bash || echo "IDBA-UD sr-diabetesi: Failed" | tee -a logs/assembly/log_assemble_idba_sr-diabetes.log
## sr-gut
bash code/assembly/idba/run_idba_sr-gut.bash || echo "IDBA-UD sr-gut: Failed" | tee -a logs/assembly/log_assemble_idba_sr-gut.log
## sr-marine_sediment
bash code/assembly/idba/run_idba_sr-marine_sediment.bash || echo "IDBA-UD sr-marine_sediment: Failed" | tee -a logs/assembly/log_assemble_idba_sr-marine_sediment.log

