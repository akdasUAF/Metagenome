#!/bin/bash
# Analyzer: assembly-stats
## Assembler: flye
## Dataset: lr-gut

./tools/analysis/assembly-stats/build/assembly-stats data/MAG/flye/lr-gut/assembly.fasta | tee data/analysis/flye/lr-gut/assembly-stats_flye_lr-gut.txt
