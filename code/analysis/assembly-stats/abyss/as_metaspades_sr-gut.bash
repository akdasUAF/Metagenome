#!/bin/bash
# Analyzer: assembly-stats
## Assembler: abyss
## Dataset: sr-gut

./tools/analysis/assembly-stats/build/assembly-stats data/MAG/abyss/sr-gut/abyss_sr-gut-contigs.fa | tee data/analysis/abyss/sr-gut/assembly-stats_abyss_sr-gut.txt

