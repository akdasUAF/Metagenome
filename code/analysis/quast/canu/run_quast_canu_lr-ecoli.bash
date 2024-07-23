#!/bin/bash
## Analyzer: metaquast
## Assembler: canu
## Dataset: lr-ecoli

bash code/analysis/dool/start_dool.bash logs/analysis/dool/quast/log_dool_quast_canu_lr-ecoli.log
conda run -n ana_metaquast bash code/analysis/quast/canu/scripts/quast_canu_lr-ecoli.bash | tee logs/analysis/log_quast_canu_lr-ecoli.log || echo 'Quast (canu lr-ecoli) failed'
bash code/analysis/dool/kill_dool.bash
