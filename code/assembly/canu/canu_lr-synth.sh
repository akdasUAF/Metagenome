#!/bin/bash

## Dataset: lr-synth
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/SRX14622818%5Baccn
## Assembler: canu

mkdir -p data/MAG/canu/lr-synth
mkdir -p data/analysis/canu/lr-synth
.tools/assemblers/canu-2.2/bin/canu -p lr-synth -d data/MAG/canu/lr-synth/ genomeSize = 220000000 -nanopore data/raw/lr-synth/SRR22366767/SRR22366767.fastq
