#!/bin/bash
## Analyzer: metaquast
## Assembler: metaspades
## Dataset: sr-gut


conda run -n ana_metaquast bash code/analysis/quast/metaspades/scripts/quast_metaspades_sr-gut.bash | tee logs/analysis/log_quast_metaspades_sr-gut.log
