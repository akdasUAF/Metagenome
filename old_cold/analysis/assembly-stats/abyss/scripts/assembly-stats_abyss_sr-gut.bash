#!/bin/bash
# Analyzer: assembly-stats
## Assembler: abyss
## Dataset: sr-gut

mkdir -p data/assembled_MAG//abyss/sr-gut/assembly-stats/
./tools/analysis/assembly-stats/build/assembly-stats data/assembled_MAG//abyss/sr-gut/final.contigs.fa | tee data/assembled_MAG//flye/lr-ecoli/assembly-stats/assembly-stats_flye_lr-ecoli.txt