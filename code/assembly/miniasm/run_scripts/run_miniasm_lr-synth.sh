#!/bin/bash

## Assembler: miniasm
## Dataset: lr-synth

mkdir -p data/analysis/miniasm/lr-synth/
bash code/analysis/dool/start_dool.sh data/analysis/miniasm/sr-bsc/dool_asm_miniasm_sr-bsc

conda run -n asm_miniasm bash code/assembly/miniasm/miniasm_lr-synth.sh | tee data/analysis/miniasm/lr-synth/log_assemble_miniasm_lr-synth.log

bash code/analysis/dool/kill_dool.sh
