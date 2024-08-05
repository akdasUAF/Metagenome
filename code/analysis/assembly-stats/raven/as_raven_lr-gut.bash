#!/bin/bash
# Analyzer: assembly-stats
## Assembler: raven
## Dataset: lr-gut

./tools/analysis/assembly-stats/build/assembly-stats data/MAG/raven/lr-gut/assembly_raven_lr-gut.fasta | tee data/analysis/raven/lr-gut/assembly-stats_raven_lr-gut.txt
