#!/bin/bash
# Analyzer: assembly-stats
## Assembler: abyss
## Dataset: sr-diabetes

mkdir -p data/assembled_MAG//abyss/sr-diabetes/assembly-stats/
./tools/analysis/assembly-stats/build/assembly-stats data/assembled_MAG//abyss/sr-diabetes/final.contigs.fa | tee data/assembled_MAG//flye/lr-ecoli/assembly-stats/assembly-stats_flye_lr-ecoli.txt