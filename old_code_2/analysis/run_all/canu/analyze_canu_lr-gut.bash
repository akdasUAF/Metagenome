#!/bin/bash
## Assembler: canu
## Dataset: Long read gut

bash ./code/analysis/quast/canu/run_quast_canu_lr-gut.bash
bash ./code/analysis/busco/canu/run_busco_canu_lr-gut.bash
