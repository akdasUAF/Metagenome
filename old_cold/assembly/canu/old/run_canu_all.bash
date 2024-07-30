#!/bin/bash
## Assembler: canu

## lr-ecoli
bash code/assembly/canu/run_canu_lr-ecoli.bash || echo "Canu lr-ecoli: Failed" >> logs/assembly/log_assemble_canu_lr-ecoli.log

## lr-gut
bash code/assembly/canu/run_canu_lr-gut.bash || echo "Canu lr-gut: Failed" >> logs/assembly/log_assemble_canu_lr-gut.log

## lr-marine_sediment
bash code/assembly/canu/run_canu_lr-marine_sediment.bash || echo "Canu lr-marine_sediment: Failed" | tee -a logs/assembly/log_assemble_canu_lr-marine_sediment.log

## lr-soil
bash code/assembly/canu/run_canu_lr-soil.bash || echo "Canu lr-soil: Failed" >> logs/assembly/log_assemble_canu_lr-soil.log

