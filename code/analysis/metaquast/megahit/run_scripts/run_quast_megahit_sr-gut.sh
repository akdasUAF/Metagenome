#!/bin/bash
## Analyzer: Megaquast
## Assembler: Megahit
## Dataset: sr-gut

bash code/analysis/dool/start_dool.sh data/analysis/megahit/sr-gut/dool_metaquast_asm_canu_lr-ecoli.csv

conda run -n ana_metaquast bash -c "source code/analysis/metaquast/megahit/quast_megahit_sr-gut.sh" | tee data/analysis/megahit/sr-gut/log_quast_megahit_sr-gut.log

bash code/analysis/dool/kill_dool.sh