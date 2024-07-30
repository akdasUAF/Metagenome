#!/bin/bash/
# Analyzer: assembly-stats
## Assembler: raven
## Dataset: lr-gut

mkdir -p data/assembled_MAG//raven/lr-gut/assembly-stats/
./tools/analysis/assembly-stats/build/assembly-stats data/assembled_MAG//raven/lr-gut/assembly_raven_lr-gut.fasta | tee data/assembled_MAG//raven/lr-gut/assembly-stats/assembly-stats_raven_lr-gut.txt