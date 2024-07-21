#!/bin/bash/
# Analyzer: assembly-stats
## Assembler: canu
## Dataset: lr-gut

mkdir -p data/process/canu/lr-gut/assembly-stats/
./tools/analysis/assembly-stats/build/assembly-stats data/process/canu/lr-gut/lr-gut.contigs.fasta | tee data/process/canu/lr-gut/assembly-stats/assembly-stats_canu_lr-gut.txt