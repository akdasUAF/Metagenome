#!/bin/bash
# Analyzer: assembly-stats
## Assembler: canu
## Dataset: lr-ecoli

./tools/analysis/assembly-stats/build/assembly-stats data/MAG/canu/lr-ecoli/lr-ecoli.contigs.fasta | tee data/analysis/canu/lr-ecoli/assembly-stats_canu_lr-ecoli.txt
