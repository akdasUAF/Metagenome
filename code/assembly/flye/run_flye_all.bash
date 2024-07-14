#!/bin/bash
## Assembler: flye

## lr-ecoli
bash code/assembly/flye/run_flye_lr-ecoli.bash || echo "Flye lr-ecoli: Failed" | tee -a logs/assembly/log_assemble_canu_lr-soil.log
## lr-gut
bash code/assembly/flye/run_flye_lr-gut.bash || echo "Flye lr-gut: Failed" | tee -a logs/assembly/log_assemble_canu_lr-soil.log
## lr-marine_sediment
bash code/assembly/flye/run_flye_lr-marine_sediment.bash || echo "Flye lr-marine_sediment: Failed" | tee -a logs/assembly/log_assemble_canu_lr-soil.log
## lr-soil
bash code/assembly/flye/run_flye_lr-soil.bash || echo "Flye lr-soil: Failed" | tee -a logs/assembly/log_assemble_canu_lr-soil.log

