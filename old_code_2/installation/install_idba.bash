#!/bin/bash

### Install Dependencies
#conda install cmake zlib bz2file conda-forge::m2-libbz2 gcc_linux-64 autoconf automake
conda install cmake zlib bz2file gcc_linux-64 autoconf automake

## Get base directory
base_dir=$(pwd)

cd tools/assemblers/ || exit
git clone https://github.com/loneknightpy/idba.git

cd idba/ || exit
./build.sh


cd "$base_dir" || exit
echo "tools/assemblers/idba/bin/" > code/analysis/path_analyzer/idba.txt || echo 'IDBA not installed'
