#!/bin/bash/
# Analyzer: assembly-stats
## Assembler: abyss
## Dataset: sr-diabetes

mkdir -p data/process/abyss/sr-diabetes/assembly-stats/
./tools/analysis/assembly-stats/build/assembly-stats data/process/abyss/sr-diabetes/final.contigs.fa | tee data/process/flye/lr-ecoli/assembly-stats/assembly-stats_flye_lr-ecoli.txt