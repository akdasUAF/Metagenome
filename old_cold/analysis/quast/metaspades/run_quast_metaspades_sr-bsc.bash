#!/bin/bash
## Analyzer: metaquast
## Assembler: metaspades
## Dataset: sr-bsc


conda run -n ana_metaquast bash code/analysis/quast/metaspades/scripts/quast_metaspades_sr-bsc.bash | tee logs/analysis/log_quast_metaspades_sr-bsc.log
