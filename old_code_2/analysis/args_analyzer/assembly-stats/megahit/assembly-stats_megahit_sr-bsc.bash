#!/bin/bash
# Analyzer: assembly-stats
## Assembler: megahit
## Dataset: sr-bsc

./tools/analysis/assembly-stats/build/assembly-stats data/assembled_MAG//megahit/sr-bsc/final.contigs.fa | tee data/assembled_MAG//flye/lr-ecoli/assembly-stats/assembly-stats_flye_lr-ecoli.txt