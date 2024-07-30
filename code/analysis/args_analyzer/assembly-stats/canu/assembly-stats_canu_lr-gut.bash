#!/bin/bash/
# Analyzer: assembly-stats
## Assembler: canu
## Dataset: lr-gut

mkdir -p data/assembled_MAG//canu/lr-gut/assembly-stats/
./tools/analysis/assembly-stats/build/assembly-stats data/assembled_MAG//canu/lr-gut/lr-gut.contigs.fasta | tee data/assembled_MAG//canu/lr-gut/assembly-stats/assembly-stats_canu_lr-gut.txt