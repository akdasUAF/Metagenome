#!/bin/bash

## Dataset: lr-soil
## Uses this dataset: 
## Assembler: miniasm
mkdir -p data/MAG/miniasm/lr-soil/

./tools/assemblers/minimap2/minimap2 -x ava-ont data/raw/lr-soil/SRR21053856/SRR21053856.fastq data/raw/lr-soil/SRR21053856/SRR21053856.fastq > data/MAG/miniasm/lr-soil/overlap_minimap_lr-soil.paf
./tools/assemblers/miniasm/miniasm -f data/raw/lr-soil/SRR21053856/SRR21053856.fastq data/MAG/miniasm/lr-soil/overlap_minimap_lr-soil.paf > data/MAG/miniasm/lr-soil/assembly_minimap_lr-soil.gfa
minipolish -t 12 data/raw/lr-soil/SRR21053856/SRR21053856.fastq data/MAG/miniasm/lr-soil/assembly_minimap_lr-soil.gfa > data/MAG/miniasm/lr-soil/polished_assembly_minimap_lr-soil.gfa

bash code/processing/convert_gfa_to_fasta.bash data/MAG/miniasm/lr-soil/polished_assembly_minimap_lr-soil.gfa data/MAG/miniasm/lr-soil/polished_assembly_minimap_lr-soil.fasta
