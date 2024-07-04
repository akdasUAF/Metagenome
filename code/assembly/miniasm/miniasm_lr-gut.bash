#!/bin/bash

## Dataset: Long Read E. coli
## Uses this dataset: 
## Assembler: miniasm
mkdir -p data/process/miniasm/lr-gut/logs
touch data/process/miniasm/lr-ecoli/logs/log_miniasm_lr-ecoli.txt

./tools/assemblers/minimap2/minimap2 -x ava-ont data/raw/lr-gut/SRR18491310/SRR18491310.fastq data/raw/lr-gut/SRR18491310/SRR18491310.fastq > data/process/miniasm/lr-gut/overlap_minimap_lr-gut.paf
./tools/assemblers/miniasm/miniasm -f data/raw/lr-gut/SRR18491310/SRR18491310.fastqdata/process/miniasm/lr-gut/overlap_minimap_lr-gut.paf > data/process/miniasm/lr-gut/assembly_minimap_lr-gut.gfa



