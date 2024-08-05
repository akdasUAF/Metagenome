#!/bin/bash
# Analyzer: assembly-stats
## Assembler: abyss
## Dataset: sr-diabetes

./tools/analysis/assembly-stats/build/assembly-stats data/MAG/abyss/sr-diabetes/abyss_sr-diabetes-contigs.fa | tee data/analysis/abyss/sr-diabetes/assembly-stats_abyss_sr-diabetes.txt

