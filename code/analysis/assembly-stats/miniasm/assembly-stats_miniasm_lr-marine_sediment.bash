#!/bin/bash/
# Analyzer: assembly-stats
## Assembler: miniasm
## Dataset: lr-marine_sediment

mkdir -p data/process/miniasm/lr-marine_sediment/assembly-stats/
./tools/analysis/assembly-stats/build/assembly-stats data/process/miniasm/lr-marine_sediment/polished_assembly_minimap_lr-marine_sediment.fa | tee data/process/miniasm/lr-marine_sediment/assembly-stats/assembly-stats_miniasm_lr-marine_sediment.txt