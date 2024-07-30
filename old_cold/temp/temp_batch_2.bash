#!/bin/bash

## Canu lr-marine
bash code/assembly/canu/run_canu_lr-marine_sediment.bash || echo "Canu lr-marine_sediment: Failed" | tee -a logs/assembly/log_assemble_canu_lr-marine_sediment.log

## Canu lr-ecoli
bash code/assembly/canu/run_canu_lr-ecoli.bash || echo "Canu lr-ecoli: Failed" >> logs/assembly/log_assemble_canu_lr-ecoli.log


bash code/analysis/run_all/abyss/analyze_abyss_sr-bsc.bash || echo "Abyss: sr-bsc: Failed" | tee -a logs/analysis/log_analysis_abyss_sr-bsc.log

bash code/analysis/run_all/abyss/analyze_abyss_sr-marine_sediment.bash || echo "Abyss: sr-marine_sediment: Failed" | tee -a logs/analysis/log_analysis_abyss_sr-marine_sediment.log



bash code/analysis/run_all/megahit/analyze_megahit_sr-diabetes.bash


bash code/analysis/run_all/metaspades/analyze_metaspades_sr-diabetes.bash

