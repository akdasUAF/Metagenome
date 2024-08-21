#!/bin/bash

$PWD/bin/jasper.sh --reads 'sr-bsc_trimmed_SRR28765346_1.fastq sr-bsc_trimmed_SRR28765346_2.fastq' -a data/MAG/megahit/sr-bsc/final.contigs.fa  -k 25 -t 16 -p 4 1>jasper.out 2>&1