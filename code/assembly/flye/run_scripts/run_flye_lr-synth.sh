#!/bin/bash

## Assembler: flye
## Dataset: lr-synth

mkdir -p data/analysis/flye/lr-synth/
bash code/analysis/dool/start_dool.sh data/analysis/flye/lr-synth/dool_asm_flye_lr-synth.csv

conda run -n asm_flye bash -c "source code/analysis/time/run_with_time.sh code/assembly/flye/flye_lr-synth.sh" | tee data/analysis/flye/lr-synth/log_assemble_flye_lr-synth.log

bash code/analysis/dool/kill_dool.sh
