#!/bin/bash

## Assembler: MEGAHIT
## Install dependencies using conda
conda install cmake zlib bz2file conda-forge::m2-libbz2
conda install -c bioconda megahit
