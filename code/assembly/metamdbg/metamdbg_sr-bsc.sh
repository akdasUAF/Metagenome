#!/bin/bash




mkdir -p data/MAG/metamdbg/sr-bsc/
metaMDBG asm --out-dir data/MAG/metamdbg/sr-bsc/ --in-ont data/raw/sr-bsc/SRR28765359/SRR28765359_1.fastq data/raw/sr-bsc/SRR28765359/SRR28765359_2.fastq --threads 24