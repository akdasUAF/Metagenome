#!/bin/bash

## Assembler: raven
## Dataset: lr-synth

mkdir -p data/analysis/raven/lr-synth/
bash code/analysis/dool/start_dool.sh data/analysis/raven/lr-synth/dool_asm_raven_lr-synth.csv

conda run -n asm_raven bash -c "source code/analysis/time/run_with_time.sh code/assembly/raven/raven_lr-synth.sh" | tee data/analysis/raven/lr-synth/log_assemble_raven_lr-synth.log
bash code/analysis/dool/kill_dool.sh
