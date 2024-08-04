#!/bin/bash
## Analyzer: Megaquast
## Assembler: Megahit
## Dataset: Short Read

bash code/analysis/dool/start_dool.sh data/analysis/megahit/sr-bsc/dool_metaquast_asm_canu_lr-ecoli.csv

conda run -n ana_metaquast bash -c "source code/analysis/metaquast/megahit/quast_megahit_sr-bsc.sh" | tee data/analysis/megahit/sr-bsc/log_quast_megahit_sr-bsc.log

bash code/analysis/dool/kill_dool.sh