#!/bin/bash
## Analyzer: Busco
## Assembler: Flye
## Dataset: Long read Synth


conda run -n ana_busco bash code/analysis/busco/flye/scripts/busco_flye_lr-synth.bash | tee logs/analysis/log_busco_flye_lr-synth.log
