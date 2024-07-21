#!/bin/bash/
# Analyzer: assembly-stats
## Assembler: flye
## Dataset: lr-gut

mkdir -p data/process/flye/lr-gut/assembly-stats/
./tools/analysis/assembly-stats/build/assembly-stats data/process/flye/lr-gut/assembly.fasta | tee data/process/flye/lr-gut/assembly-stats/assembly-stats_flye_lr-gut.txt