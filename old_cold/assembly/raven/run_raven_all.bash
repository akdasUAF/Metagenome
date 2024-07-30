#!/bin/bash
## Assembler: raven

## lr-ecoli
bash code/assembly/raven/run_raven_lr-ecoli.bash || echo "Raven lr-ecoli: Failed" | tee -a logs/assembly/log_assemble_raven_lr-ecoli.log
## lr-gut
bash code/assembly/raven/run_raven_lr-gut.bash || echo "Raven lr-gut: Failed" | tee -a logs/assembly/log_assemble_raven_lr-gut.log
## lr-marine_sediment
bash code/assembly/raven/run_raven_lr-marine_sediment.bash || echo "Raven lr-marine_sediment: Failed" | tee -a logs/assembly/log_assemble_raven_lr-marine_sediment.log
## lr-soil
bash code/assembly/raven/run_raven_lr-soil.bash || echo "Raven lr-soil: Failed" | tee -a logs/assembly/log_assemble_raven_lr-soil.log

