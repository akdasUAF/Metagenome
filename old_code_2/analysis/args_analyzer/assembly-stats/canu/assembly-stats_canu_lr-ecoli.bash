#!/bin/bash
# Analyzer: assembly-stats
## Assembler: canu
## Dataset: lr-ecoli

mkdir -p data/assembled_MAG//canu/lr-ecoli/assembly-stats/
./tools/analysis/assembly-stats/build/assembly-stats data/assembled_MAG//canu/lr-ecoli/lr-ecoli.contigs.fasta | tee data/assembled_MAG//canu/lr-ecoli/assembly-stats/assembly-stats_canu_lr-ecoli.txt
