#!/bin/bash
# Analyzer: assembly-stats
## Assembler: abyss
## Dataset: sr-bsc

./tools/analysis/assembly-stats/build/assembly-stats data/MAG/abyss/sr-bsc/abyss_sr-bsc-contigs.fa | tee data/analysis/abyss/sr-bsc/assembly-stats_abyss_sr-bsc.txt

