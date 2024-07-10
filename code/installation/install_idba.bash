#!/bin/bash

conda activate asm_idba

### Install Dependencies
conda install cmake zlib bz2file conda-forge::m2-libbz2 gcc_linux-64 autoconf automake

cd tools/
git clone https://github.com/loneknightpy/idba.git

cd idba/
./build.sh

conda deactivate asm_canu