#!/bin/bash

## Assembler: canu
## Dataset: lr-synth

mkdir -p data/analysis/canu/lr-synth/
bash code/analysis/dool/start_dool.sh data/analysis/canu/dool_asm_canu_lr-synth.csv

conda run -n asm_canu bash code/assembly/canu/canu_lr-synth.sh | tee data/analysis/canu/lr-synth/log_assemble_canu_lr-synth.log

bash code/analysis/dool/kill_dool.sh
