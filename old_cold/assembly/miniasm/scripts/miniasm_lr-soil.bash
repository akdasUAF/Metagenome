#!/bin/bash

## Dataset: Long Read E. coli
## Uses this dataset: 
## Assembler: miniasm
mkdir -p data/process/miniasm/lr-soil/

./tools/assemblers/minimap2/minimap2 -x ava-ont data/raw/lr-soil/SRR21053856/SRR21053856.fastq data/raw/lr-soil/SRR21053856/SRR21053856.fastq > data/process/miniasm/lr-soil/overlap_minimap_lr-soil.paf
./tools/assemblers/miniasm/miniasm -f data/raw/lr-soil/SRR21053856/SRR21053856.fastq data/process/miniasm/lr-soil/overlap_minimap_lr-soil.paf > data/process/miniasm/lr-soil/assembly_minimap_lr-soil.gfa
minipolish -t 12 data/raw/lr-soil/SRR21053856/SRR21053856.fastq data/process/miniasm/lr-soil/assembly_minimap_lr-soil.gfa > data/process/miniasm/lr-soil/polished_assembly_minimap_lr-soil.gfa
