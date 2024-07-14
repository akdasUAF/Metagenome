#!/bin/bash
## Assembler: miniasm

## lr-ecoli
bash code/assembly/miniasm/run_miniasm_lr-ecoli.bash || echo "Miniasm lr-ecoli: Failed" | tee -a logs/assembly/log_assemble_miniasm_lr-ecoli.log
## lr-gut
bash code/assembly/miniasm/run_miniasm_lr-gut.bash || echo "Miniasm lr-gut: Failed" | tee -a logs/assembly/log_assemble_miniasm_lr-gut.log
## lr-marine_sediment
bash code/assembly/miniasm/run_miniasm_lr-marine_sediment.bash || echo "Miniasm lr-marine_sediment: Failed" | tee -a logs/assembly/log_assemble_miniasm_lr-marine_sediment.log
## lr-soil
bash code/assembly/miniasm/run_miniasm_lr-soil.bash || echo "Miniasm lr-soil: Failed" | tee -a logs/assembly/log_assemble_miniasm_lr-soil.log

