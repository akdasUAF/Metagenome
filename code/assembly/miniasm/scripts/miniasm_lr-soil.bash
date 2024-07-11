#!/bin/bash

## Dataset: Long Read E. coli
## Uses this dataset: 
## Assembler: miniasm
mkdir -p data/process/miniasm/lr-soil/

./tools/assemblers/minimap2/minimap2 -x ava-ont data/raw/lr-soil/SRR21053856.fastq data/raw/lr-soil/SRR21053856.fastq > data/process/miniasm/lr-soil/overlap_minimap_lr-soil.paf
./tools/assemblers/miniasm/miniasm -f data/raw/lr-soil/SRR21053856.fastq data/process/miniasm/lr-soil/overlap_minimap_lr-soil.paf > data/process/miniasm/lr-soil/assembly_minimap_lr-soil.gfa

python3 code/processing/gfa_to_fa.py data/process/miniasm/lr-soil/assembly_minimap_lr-soil.gfa