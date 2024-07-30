#!/bin/bash
## Analyzer: metaquast
## Assembler: metaspades
## Dataset: sr-marine_sediment


conda run -n ana_metaquast bash code/analysis/quast/metaspades/scripts/quast_metaspades_sr-marine_sediment.bash | tee logs/analysis/log_quast_metaspades_sr-marine_sediment.log
