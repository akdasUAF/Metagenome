#!/bin/bash/
# Analyzer: assembly-stats
## Assembler: flye
## Dataset: lr-ecoli

mkdir -p data/process/flye/lr-ecoli/assembly-stats/
./tools/analysis/assembly-stats/build/assembly-stats data/process/flye/lr-ecoli/assembly.fasta | tee data/process/flye/lr-ecoli/assembly-stats/assembly-stats_flye_lr-ecoli.txt