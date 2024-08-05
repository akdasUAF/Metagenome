#!/bin/bash
# Analyzer: assembly-stats
## Assembler: miniasm
## Dataset: lr-ecoli

./tools/analysis/assembly-stats/build/assembly-stats data/MAG/miniasm/lr-ecoli/polished_assembly_minimap_lr-ecoli.fasta | tee data/analysis/miniasm/lr-ecoli/assembly-stats_miniasm_lr-ecoli.txt
