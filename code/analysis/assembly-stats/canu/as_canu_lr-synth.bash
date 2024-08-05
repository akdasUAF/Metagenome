#!/bin/bash
# Analyzer: assembly-stats
## Assembler: canu
## Dataset: lr-synth

./tools/analysis/assembly-stats/build/assembly-stats data/MAG/canu/lr-synth/lr-synth.contigs.fasta | tee data/analysis/canu/lr-synth/assembly-stats_canu_lr-synth.txt
