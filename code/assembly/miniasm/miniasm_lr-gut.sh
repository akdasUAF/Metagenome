#!/bin/bash

## Dataset: lr-gut
## Uses this dataset: 
## Assembler: miniasm
mkdir -p data/MAG/miniasm/lr-gut/

./tools/assemblers/minimap2/minimap2 -x ava-ont data/raw/lr-gut/SRR18491310/SRR18491310.fastq data/raw/lr-gut/SRR18491310/SRR18491310.fastq > data/MAG/miniasm/lr-gut/overlap_minimap_lr-gut.paf
./tools/assemblers/miniasm/miniasm -f data/raw/lr-gut/SRR18491310/SRR18491310.fastq data/MAG/miniasm/lr-gut/overlap_minimap_lr-gut.paf > data/MAG/miniasm/lr-gut/assembly_minimap_lr-gut.gfa
minipolish -t 12 data/raw/lr-gut/SRR18491310/SRR18491310.fastq data/MAG/miniasm/lr-gut/assembly_minimap_lr-gut.gfa > data/MAG/miniasm/lr-gut/polished_assembly_minimap_lr-gut.gfa

./tools/processing/gfastats/build/bin/gfastats data/MAG/miniasm/lr-gut/polished_assembly_minimap_lr-gut.gfa -o data/MAG/miniasm/lr-gut/polished_assembly_minimap_lr-gut.fasta
