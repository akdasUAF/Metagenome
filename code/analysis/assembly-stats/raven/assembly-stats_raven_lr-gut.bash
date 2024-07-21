#!/bin/bash/
# Analyzer: assembly-stats
## Assembler: raven
## Dataset: lr-gut

mkdir -p data/process/raven/lr-gut/assembly-stats/
./tools/analysis/assembly-stats/build/assembly-stats data/process/raven/lr-gut/assembly_raven_lr-gut.fasta | tee data/process/raven/lr-gut/assembly-stats/assembly-stats_raven_lr-gut.txt