#!/bin/bash

### Install Dependencies
conda install pkg-config matplotlib gcc_linux-64 python-matplotlib

## Get base directory
base_dir=$(pwd)

cd tools/analysis/ || exit
git clone https://github.com/ablab/quast.git

cd "$base_dir" || exit

find ./tools/analysis/quast/ -maxdepth 1 -name "metaquast" -type f -print > code/analysis/path_analyzer/metaquast.txt || echo 'Quast not installed'
