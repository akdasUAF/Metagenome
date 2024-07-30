#!/bin/bash
## Analyzer: Busco
## Assembler: Raven
## Dataset: lr-synth


conda run -n ana_busco bash code/analysis/busco/miniasm/scripts/busco_miniasm_lr-synth.bash | tee logs/analysis/log_busco_miniasm_lr-synth.log
