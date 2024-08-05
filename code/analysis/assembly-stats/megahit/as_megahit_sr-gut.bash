#!/bin/bash
# Analyzer: assembly-stats
## Assembler: megahit
## Dataset: sr-gut

./tools/analysis/assembly-stats/build/assembly-stats data/MAG/megahit/sr-gut/final.contigs.fa | tee data/analysis/megahit/sr-gut/assembly-stats_megahit_sr-gut.txt
