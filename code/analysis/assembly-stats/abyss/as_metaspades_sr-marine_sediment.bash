#!/bin/bash
# Analyzer: assembly-stats
## Assembler: abyss
## Dataset: sr-marine_sediment

./tools/analysis/assembly-stats/build/assembly-stats data/MAG/abyss/sr-marine_sediment/abyss_sr-marine_sediment-contigs.fa | tee data/analysis/abyss/sr-marine_sediment/assembly-stats_abyss_sr-marine_sediment.txt

