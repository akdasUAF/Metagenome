#!/bin/bash
## Analyzer: Busco
## Assembler: metaspades
## Dataset: Short Read Gut


conda run -n ana_busco bash code/analysis/busco/metaspades/scripts/busco_metaspades_sr-gut.bash | tee logs/analysis/log_busco_metaspades_sr-gut.log

