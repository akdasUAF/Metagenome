#!/bin/bash
# Analyzer: assembly-stats
## Assembler: flye
## Dataset: lr-marine_sediment

mkdir -p data/assembled_MAG//flye/lr-marine_sediment/assembly-stats/
./tools/analysis/assembly-stats/build/assembly-stats data/assembled_MAG//flye/lr-marine_sediment/assembly.fasta | tee data/assembled_MAG//flye/lr-marine_sediment/assembly-stats/assembly-stats_flye_lr-marine_sediment.txt