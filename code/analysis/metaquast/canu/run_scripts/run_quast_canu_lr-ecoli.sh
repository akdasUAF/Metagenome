#!/bin/bash
## Analyzer: Megaquast
## Assembler: canu
## Dataset: Short Read

bash code/analysis/dool/start_dool.sh data/analysis/canu/lr-ecoli/dool_metaquast_asm_canu_lr-ecoli.csv

conda run -n ana_metaquast bash -c "source code/analysis/metaquast/canu/quast_canu_lr-ecoli.sh" | tee data/analysis/canu/lr-ecoli/log_quast_canu_lr-ecoli.log

bash code/analysis/dool/kill_dool.sh