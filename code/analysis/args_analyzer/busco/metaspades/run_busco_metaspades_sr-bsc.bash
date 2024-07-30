#!/bin/bash
## Analyzer: Busco
## Assembler: metaspades
## Dataset: Short Read BSCs


conda run -n ana_busco bash code/analysis/busco/metaspades/scripts/busco_metaspades_sr-bsc.bash | tee logs/analysis/log_busco_metaspades_sr-bsc.log

