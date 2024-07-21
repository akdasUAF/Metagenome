#!/bin/bash/
# Analyzer: assembly-stats
## Assembler: abyss
## Dataset: sr-gut

mkdir -p data/process/abyss/sr-gut/assembly-stats/
./tools/analysis/assembly-stats/build/assembly-stats data/process/abyss/sr-gut/final.contigs.fa | tee data/process/flye/lr-ecoli/assembly-stats/assembly-stats_flye_lr-ecoli.txt