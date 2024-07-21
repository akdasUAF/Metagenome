#!/bin/bash/
# Analyzer: assembly-stats
## Assembler: miniasm
## Dataset: lr-gut

mkdir -p data/process/miniasm/lr-gut/assembly-stats/
./tools/analysis/assembly-stats/build/assembly-stats data/process/miniasm/lr-gut/polished_assembly_minimap_lr-gut.fa | tee data/process/miniasm/lr-gut/assembly-stats/assembly-stats_miniasm_lr-gut.txt