#!/bin/bash
## Analyzer: kmergenie

conda install bioconda::kmergenie zlib r-base

## Get base directory
base_dir=$(pwd)

wget -O tools/analysis/kmergenie-1.7051.tar.gz http://kmergenie.bx.psu.edu/kmergenie-1.7051.tar.gz
tar -xzvf tools/analysis/kmergenie-1.7051.tar.gz -C tools/analysis/

cd tools/analysis/kmergenie-1.7051/ || exit


cd "$base_dir" || exit

find ./tools/analysis/kmergenie*/ -maxdepth 1 -name "kmergenie" -type f -print > code/analysis/path_analyzer/kmergenie.txt || echo 'Kmergenie not installed'

