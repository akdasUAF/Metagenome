#!/bin/bash
# Analyzer: assembly-stats
## Assembler: flye
## Dataset: lr-synth

./tools/analysis/assembly-stats/build/assembly-stats data/MAG/flye/lr-synth/assembly.fasta | tee data/analysis/flye/lr-synth/assembly-stats_flye_lr-synth.txt
