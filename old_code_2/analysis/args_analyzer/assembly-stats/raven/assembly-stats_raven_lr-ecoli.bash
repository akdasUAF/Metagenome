#!/bin/bash
# Analyzer: assembly-stats
## Assembler: flye
## Dataset: lr-ecoli

mkdir -p data/assembled_MAG//flye/lr-ecoli/assembly-stats/
./tools/analysis/assembly-stats/build/assembly-stats data/assembled_MAG//flye/lr-ecoli/assembly.fasta | tee data/assembled_MAG//flye/lr-ecoli/assembly-stats/assembly-stats_flye_lr-ecoli.txt