#!/bin/bash/
# Analyzer: assembly-stats
## Assembler: abyss
## Dataset: sr-bsc

mkdir -p data/process/abyss/sr-bsc/assembly-stats/
./tools/analysis/assembly-stats/build/assembly-stats data/process/abyss/sr-bsc/abyss_sr-bsc-contigs.fa | tee data/process/flye/lr-ecoli/assembly-stats/assembly-stats_flye_lr-ecoli.txt