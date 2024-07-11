#!/bin/bash

## Dataset: Short Read Marine Sediment
## Uses this dataset: 
## Assembler: IDBA-UD

mkdir -p data/process/idba/sr-marine_sediment/

### Setting up reads. They must be in a single fasta and not two fastq
./tools/assemblers/idba/bin/fq2fa --merge --filter data/raw/sr-marine_sediment/SRR27456520/SRR27456520_1.fastq data/raw/sr-marine_sediment/SRR27456520/SRR27456520_2.fastq data/raw/sr-marine_sediment/SRR27456520/SRR27456520_combined.fasta

tools/assemblers/idba/bin/idba_ud -r data/raw/sr-marine_sediment/SRR27456520/SRR27456520_combined.fasta -o data/process/idba/sr-marine_sediment/