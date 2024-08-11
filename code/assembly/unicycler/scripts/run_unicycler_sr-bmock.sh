#!/bin/bash

mkdir -p data/MAG/unicycler/sr-bmock/
unicycler -1 data/process/sr-bmock/trimmed/sr-bmock_trimmed_SRR8073716_1.fastq.gz -2 data/process/sr-bmock/trimmed/sr-bmock_trimmed_SRR8073716_2.fastq.gz -o data/MAG/unicycler/sr-bmock/