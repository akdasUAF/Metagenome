#!/bin/bash

conda install zlib cmake

cd tools/analysis/ || exit
git clone https://github.com/sanger-pathogens/assembly-stats.git

mkdir assembly-stats/build/ && cd assembly-stats/build/ || exit
cmake ..
make
make test
cmake -DINSTALL_DIR:PATH=../../assembly-stats-installed ..


