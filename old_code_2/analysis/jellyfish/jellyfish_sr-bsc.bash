#!/bin/bash/

./tools/analysis/jellyfish-2.3.1/bin/jellyfish count -t 12 -C -m 19 -s 5G -o 19mer_out --min-qual-char=? data/raw/sr-bsc/SRR28765359/SRR28765359_1.fastq data/raw/sr-bsc/SRR28765359/SRR28765359_2.fastq

./tools/analysis/jellyfish-2.3.1/bin/jellyfish count -t 12 -C -m 31 -s 5G -o 31mer_out --min-qual-char=? data/raw/sr-bsc/SRR28765359/SRR28765359_1.fastq data/raw/sr-bsc/SRR28765359/SRR28765359_2.fastq
./tools/analysis/jellyfish-2.3.1/bin/jellyfish histo -o 31mer_out.histo 31mer_out


./tools/analysis/jellyfish-2.3.1/bin/jellyfish count -t 12 -C -m 41 -s 3G -o 41mer_out --min-qual-char=? data/raw/sr-bsc/SRR28765359/SRR28765359_1.fastq data/raw/sr-bsc/SRR28765359/SRR28765359_2.fastq
./tools/analysis/jellyfish-2.3.1/bin/jellyfish histo -o 41mer_out.histo 41mer_out








