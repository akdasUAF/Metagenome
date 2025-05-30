#!/bin/bash

## Dataset: Long-read synth
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/SRX14622818%5Baccn
## Assembler: Canu

mkdir -p data/process/canu/lr-synth
.tools/assemblers/canu-2.2/bin/canu -p lr-synth -d data/process/canu/lr-synth/ genomeSize = 220000000 -nanopore data/raw/lr-synth/SRR22366767/SRR22366767.fastq