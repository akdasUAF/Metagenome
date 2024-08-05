#!/bin/bash
# Analyzer: assembly-stats
## Assembler: metaspades
## Dataset: sr-gut

./tools/analysis/assembly-stats/build/assembly-stats data/MAG/metaspades/sr-gut/contigs.fasta | tee data/analysis/metaspades/sr-gut/assembly-stats_metaspades_sr-gut.txt
