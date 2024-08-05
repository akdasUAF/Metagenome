#!/bin/bash
# Analyzer: assembly-stats
## Assembler: flye
## Dataset: lr-marine_sediment

./tools/analysis/assembly-stats/build/assembly-stats data/MAG/flye/lr-marine_sediment/assembly.fasta | tee data/analysis/flye/lr-marine_sediment/assembly-stats_flye_lr-marine_sediment.txt
