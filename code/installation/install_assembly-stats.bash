#!/bin/bash

conda install zlib cmake

## Get base directory
base_dir=$(pwd)

cd tools/analysis/ || exit
git clone https://github.com/sanger-pathogens/assembly-stats.git

mkdir assembly-stats/build/ && cd assembly-stats/build/ || exit
cmake ..
make
make test
cmake -DINSTALL_DIR:PATH=../../assembly-stats-installed ..


cd "$base_dir" || exit

find ./tools/analysis/assembly-stats/build/ -name "assembly-stats" -type f -print > code/analysis/path_analyzer/assembly-stats.txt || echo 'Assembly-stats not installed'