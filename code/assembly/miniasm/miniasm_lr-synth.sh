#!/bin/bash

## Dataset: lr-synth
## Uses this dataset: 
## Assembler: miniasm
mkdir -p data/MAG/miniasm/lr-synth/

./tools/assemblers/minimap2/minimap2 -x ava-ont data/raw/lr-synth/SRR22366767/SRR22366767.fastq data/raw/lr-synth/SRR22366767/SRR22366767.fastq > data/MAG/miniasm/lr-synth/overlap_minimap_lr-synth.paf
./tools/assemblers/miniasm/miniasm -f data/raw/lr-synth/SRR22366767/SRR22366767.fastq data/MAG/miniasm/lr-synth/overlap_minimap_lr-synth.paf > data/MAG/miniasm/lr-synth/assembly_minimap_lr-synth.gfa
minipolish -t 12 data/raw/lr-synth/SRR22366767/SRR22366767.fastq data/MAG/miniasm/lr-synth/assembly_minimap_lr-synth.gfa > data/MAG/miniasm/lr-synth/polished_assembly_minimap_lr-synth.gfa

bash code/processing/convert_gfa_to_fasta.bash data/MAG/miniasm/lr-synth/polished_assembly_minimap_lr-synth.gfa data/MAG/miniasm/lr-synth/polished_assembly_minimap_lr-synth.fasta
