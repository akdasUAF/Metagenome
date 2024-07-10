#!/bin/bash

## Assembler: MEGAHIT
conda activate asm_megahit

## Install dependencies using conda
conda install cmake zlib bz2file conda-forge::m2-libbz2
conda install -c bioconda megahit

## Echo output path to use for 
conda deactivate asm_megahit