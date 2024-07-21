#!/bin/bash/
# Analyzer: assembly-stats
## Assembler: abyss
## Dataset: sr-marine_sediment

mkdir -p data/process/abyss/sr-marine_sediment/assembly-stats/
./tools/analysis/assembly-stats/build/assembly-stats data/process/abyss/sr-marine_sediment/final.contigs.fa | tee data/process/flye/lr-ecoli/assembly-stats/assembly-stats_flye_lr-ecoli.txt

