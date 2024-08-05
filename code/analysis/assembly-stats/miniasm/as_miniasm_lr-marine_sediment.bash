#!/bin/bash
# Analyzer: assembly-stats
## Assembler: miniasm
## Dataset: lr-marine_sediment

./tools/analysis/assembly-stats/build/assembly-stats data/MAG/miniasm/lr-marine_sediment/polished_assembly_minimap_lr-marine_sediment.fasta | tee data/analysis/miniasm/lr-marine_sediment/assembly-stats_miniasm_lr-marine_sediment.txt
