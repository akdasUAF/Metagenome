#!/bin/bash
## Analyzer: Megaquast
## Assembler: raven
## Dataset: Short Read

bash code/analysis/dool/start_dool.sh data/analysis/raven/lr-ecoli/dool_metaquast_asm_canu_lr-ecoli.csv

conda run -n ana_metaquast bash -c "source code/analysis/metaquast/raven/quast_raven_lr-ecoli.sh" | tee data/analysis/raven/lr-ecoli/log_quast_raven_lr-ecoli.log

bash code/analysis/dool/kill_dool.sh