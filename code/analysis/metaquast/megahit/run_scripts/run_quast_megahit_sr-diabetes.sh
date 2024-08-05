#!/bin/bash
## Analyzer: Megaquast
## Assembler: Megahit
## Dataset: Short Read

bash code/analysis/dool/start_dool.sh data/analysis/megahit/sr-diabetes/dool_metaquast_asm_canu_lr-ecoli.csv

conda run -n ana_metaquast bash -c "source code/analysis/metaquast/megahit/quast_megahit_sr-diabetes.sh" | tee data/analysis/megahit/sr-diabetes/log_quast_megahit_sr-diabetes.log

bash code/analysis/dool/kill_dool.sh