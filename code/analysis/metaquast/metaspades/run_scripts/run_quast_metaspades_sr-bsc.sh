#!/bin/bash
## Analyzer: Megaquast
## Assembler: metaspades
## Dataset: Short Read

bash code/analysis/dool/start_dool.sh data/analysis/metaspades/sr-bsc/dool_metaquast_asm_metaspades_lr-ecoli.csv

conda run -n ana_metaquast bash -c "source code/analysis/metaquast/metaspades/quast_metaspades_sr-bsc.sh" | tee data/analysis/metaspades/sr-bsc/log_quast_metaspades_sr-bsc.log

bash code/analysis/dool/kill_dool.sh