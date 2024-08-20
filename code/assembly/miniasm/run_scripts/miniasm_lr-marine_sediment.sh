#!/bin/bash

## Dataset: lr-marine_sediment
## Uses this dataset: 
## Assembler: miniasm
mkdir -p data/MAG/miniasm/lr-marine_sediment/

./tools/assemblers/minimap2/minimap2 -x ava-ont data/raw/lr-marine_sediment/SRR27145287/SRR27145287.fastq data/raw/lr-marine_sediment/SRR27145287/SRR27145287.fastq > data/MAG/miniasm/lr-marine_sediment/overlap_minimap_lr-marine_sediment.paf
./tools/assemblers/miniasm/miniasm -f data/raw/lr-marine_sediment/SRR27145287/SRR27145287.fastq data/MAG/miniasm/lr-marine_sediment/overlap_minimap_lr-marine_sediment.paf > data/MAG/miniasm/lr-marine_sediment/assembly_minimap_lr-marine_sediment.gfa
minipolish -t 12 data/raw/lr-marine_sediment/SRR27145287/SRR27145287.fastq data/MAG/miniasm/lr-marine_sediment/assembly_minimap_lr-marine_sediment.gfa > data/MAG/miniasm/lr-marine_sediment/polished_assembly_minimap_lr-marine_sediment.gfa

bash code/processing/convert_gfa_to_fasta.bash data/MAG/miniasm/lr-marine_sediment/polished_assembly_minimap_lr-marine_sediment.gfa data/MAG/miniasm/lr-marine_sediment/polished_assembly_minimap_lr-marine_sediment.fasta

