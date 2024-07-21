#!/bin/bash/
# Analyzer: assembly-stats
## Assembler: miniasm
## Dataset: lr-ecoli

mkdir -p data/process/miniasm/lr-ecoli/assembly-stats/
./tools/analysis/assembly-stats/build/assembly-stats data/process/miniasm/lr-ecoli/polished_assembly_minimap_lr-ecoli.fa | tee data/process/miniasm/lr-ecoli/assembly-stats/assembly-stats_miniasm_lr-ecoli.txt