#!/bin/bash
# Analyzer: assembly-stats
## Assembler: metaspades
## Dataset: sr-diabetes

./tools/analysis/assembly-stats/build/assembly-stats data/MAG/metaspades/sr-diabetes/contigs.fasta | tee data/analysis/metaspades/sr-diabetes/assembly-stats_metaspades_sr-diabetes.txt
