#!/bin/bash
# Analyzer: assembly-stats
## Assembler: metaspades
## Dataset: sr-bsc

./tools/analysis/assembly-stats/build/assembly-stats data/MAG/metaspades/sr-bsc/contigs.fasta | tee data/analysis/metaspades/sr-bsc/assembly-stats_metaspades_sr-bsc.txt

