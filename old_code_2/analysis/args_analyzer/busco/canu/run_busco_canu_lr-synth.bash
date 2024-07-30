#!/bin/bash
## Analyzer: Busco
## Assembler: Canu
## Dataset: Long read Synth


conda run -n ana_busco bash code/analysis/busco/canu/scripts/busco_canu_lr-synth.bash | tee logs/analysis/log_busco_canu_lr-synth.log
