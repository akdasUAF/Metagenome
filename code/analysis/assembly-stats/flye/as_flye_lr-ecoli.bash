#!/bin/bash
# Analyzer: assembly-stats
## Assembler: flye
## Dataset: lr-ecoli

./tools/analysis/assembly-stats/build/assembly-stats data/MAG/flye/lr-ecoli/assembly.fasta | tee data/analysis/flye/lr-ecoli/assembly-stats_flye_lr-ecoli.txt
