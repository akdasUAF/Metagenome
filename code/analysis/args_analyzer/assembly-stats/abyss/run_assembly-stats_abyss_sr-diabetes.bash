#!/bin/bash
## Analyzer: metaquast
## Assembler: abyss
## Dataset: sr-diabetes

conda run -n ana_assembly-stats bash code/analysis/assembly-stats/abyss/assembly-stats_abyss_sr-diabetes.bash | tee data/assembled_MAG//abyss/sr-diabetes/assembly-stats/assembly-stats_abyss_sr-diabetes.txt
