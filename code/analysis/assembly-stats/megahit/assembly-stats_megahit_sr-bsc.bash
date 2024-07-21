#!/bin/bash/
# Analyzer: assembly-stats
## Assembler: megahit
## Dataset: sr-bsc

./tools/analysis/assembly-stats/build/assembly-stats data/process/megahit/sr-bsc/final.contigs.fa | tee data/process/flye/lr-ecoli/assembly-stats/assembly-stats_flye_lr-ecoli.txt