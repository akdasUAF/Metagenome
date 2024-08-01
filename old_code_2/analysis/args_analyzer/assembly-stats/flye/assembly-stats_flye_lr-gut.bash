#!/bin/bash
# Analyzer: assembly-stats
## Assembler: flye
## Dataset: lr-gut

mkdir -p data/assembled_MAG//flye/lr-gut/assembly-stats/
./tools/analysis/assembly-stats/build/assembly-stats data/assembled_MAG//flye/lr-gut/assembly.fasta | tee data/assembled_MAG//flye/lr-gut/assembly-stats/assembly-stats_flye_lr-gut.txt