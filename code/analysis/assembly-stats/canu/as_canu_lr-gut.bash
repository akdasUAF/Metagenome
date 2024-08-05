#!/bin/bash
# Analyzer: assembly-stats
## Assembler: canu
## Dataset: lr-gut

./tools/analysis/assembly-stats/build/assembly-stats data/MAG/canu/lr-gut/lr-gut.contigs.fasta | tee data/analysis/canu/lr-gut/assembly-stats_canu_lr-gut.txt
