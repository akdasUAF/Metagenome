#!/bin/bash
# Analyzer: assembly-stats
## Assembler: megahit
## Dataset: sr-marine_sediment

./tools/analysis/assembly-stats/build/assembly-stats data/MAG/megahit/sr-marine_sediment/final.contigs.fa | tee data/analysis/megahit/sr-marine_sediment/assembly-stats_megahit_sr-marine_sediment.txt
