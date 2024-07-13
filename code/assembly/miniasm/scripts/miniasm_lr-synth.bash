#!/bin/bash

## Dataset: Long Read E. coli
## Uses this dataset: 
## Assembler: miniasm
mkdir -p data/process/miniasm/lr-synth/

./tools/assemblers/minimap2/minimap2 -x ava-ont data/raw/lr-synth/SRR22366767/SRR22366767.fastq data/raw/lr-synth/SRR22366767/SRR22366767.fastq > data/process/miniasm/lr-synth/overlap_minimap_lr-synth.paf
./tools/assemblers/miniasm/miniasm -f data/raw/lr-synth/SRR22366767/SRR22366767.fastq data/process/miniasm/lr-synth/overlap_minimap_lr-synth.paf > data/process/miniasm/lr-synth/assembly_minimap_lr-synth.gfa