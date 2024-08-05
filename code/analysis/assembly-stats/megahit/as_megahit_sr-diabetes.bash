#!/bin/bash
# Analyzer: assembly-stats
## Assembler: megahit
## Dataset: sr-diabetes

./tools/analysis/assembly-stats/build/assembly-stats data/MAG/megahit/sr-diabetes/final.contigs.fa | tee data/analysis/megahit/sr-diabetes/assembly-stats_megahit_sr-diabetes.txt
