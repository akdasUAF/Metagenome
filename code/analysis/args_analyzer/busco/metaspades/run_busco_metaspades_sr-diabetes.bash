#!/bin/bash
## Analyzer: Busco
## Assembler: metaspades
## Dataset: Short Read Diabetes


conda run -n ana_busco bash code/analysis/busco/metaspades/scripts/busco_metaspades_sr-diabetes.bash | tee logs/analysis/log_busco_metaspades_sr-diabetes.log

