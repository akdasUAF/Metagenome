#!/bin/bash/
# Analyzer: assembly-stats
## Assembler: abyss
## Dataset: sr-marine_sediment

mkdir -p data/assembled_MAG//abyss/sr-marine_sediment/assembly-stats/
./tools/analysis/assembly-stats/build/assembly-stats data/assembled_MAG//abyss/sr-marine_sediment/final.contigs.fa | tee data/assembled_MAG//flye/lr-ecoli/assembly-stats/assembly-stats_flye_lr-ecoli.txt

