#!/bin/bash
# Analyzer: assembly-stats
## Assembler: raven
## Dataset: lr-ecoli

./tools/analysis/assembly-stats/build/assembly-stats data/MAG/raven/lr-ecoli/assembly_raven_lr-ecoli.fasta | tee data/analysis/raven/lr-ecoli/assembly-stats_raven_lr-ecoli.txt
