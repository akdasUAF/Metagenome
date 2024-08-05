#!/bin/bash
# Analyzer: assembly-stats
## Assembler: miniasm
## Dataset: lr-gut

./tools/analysis/assembly-stats/build/assembly-stats data/MAG/miniasm/lr-gut/polished_assembly_minimap_lr-gut.fasta | tee data/analysis/miniasm/lr-gut/assembly-stats_miniasm_lr-gut.txt
