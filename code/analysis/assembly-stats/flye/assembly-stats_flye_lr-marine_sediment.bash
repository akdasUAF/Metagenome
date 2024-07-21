#!/bin/bash/
# Analyzer: assembly-stats
## Assembler: flye
## Dataset: lr-marine_sediment

mkdir -p data/process/flye/lr-marine_sediment/assembly-stats/
./tools/analysis/assembly-stats/build/assembly-stats data/process/flye/lr-marine_sediment/assembly.fasta | tee data/process/flye/lr-marine_sediment/assembly-stats/assembly-stats_flye_lr-marine_sediment.txt