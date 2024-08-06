#!/bin/bash

mkdir -p data/polished/canu/lr-ecoli/

## Use minimap2 to generate map file
./tools/assemblers/minimap2/minimap2 -ax ava-ont -t 14 data/MAG/canu/lr-ecoli/lr-ecoli.contigs.fasta data/raw/lr-ecoli/Loman_E.coli_MAP006-1_2D_50x.fasta > data/polished/lr-ecoli/overlap_minimap_lr-ecoli.sam

## One round of racon
racon -m 8 -x -6 -g -8 -w 500 -q -1 -t 14 data/raw/lr-ecoli/Loman_E.coli_MAP006-1_2D_50x.fasta data/polished/lr-ecoli/overlap_minimap_lr-ecoli.sam data/MAG/canu/lr-ecoli/lr-ecoli.contigs.fasta > data/polished/canu/lr-ecoli/racon_canu_lr-ecoli.fasta

## One round of medaka



