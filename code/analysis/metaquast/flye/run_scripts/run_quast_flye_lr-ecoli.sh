#!/bin/bash
## Analyzer: Megaquast
## Assembler: flye
## Dataset: Short Read

bash code/analysis/dool/start_dool.sh data/analysis/flye/lr-ecoli/dool_metaquast_asm_canu_lr-ecoli.csv

conda run -n ana_metaquast bash -c "source code/analysis/metaquast/flye/quast_flye_lr-ecoli.sh" | tee data/analysis/flye/lr-ecoli/log_quast_flye_lr-ecoli.log

bash code/analysis/dool/kill_dool.sh