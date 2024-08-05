#!/bin/bash
# Analyzer: assembly-stats
## Assembler: megahit
## Dataset: sr-bsc

./tools/analysis/assembly-stats/build/assembly-stats data/MAG/megahit/sr-bsc/final.contigs.fa | tee data/analysis/megahit/sr-bsc/assembly-stats_megahit_sr-bsc.txt
