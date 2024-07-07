#!/bin/bash

## Dataset: Long-read synth
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/SRX14622818%5Baccn
## Assembler: Canu

mkdir -p data/process/canu/lr-synth/logs
touch data/process/canu/lr-synth/logs/log_canu_lr-synth.txt
{
.tools/assemblers/canu-2.2/bin/canu -p lr-synth -d data/process/canu/lr-synth/ genomeSize = 22g -nanopore data/raw/lr-synth/SRR22366767/SRR22366767.fastq

} > data/process/canu/lr-synth/logs/log_canu_lr-synth.txt
