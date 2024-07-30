#!/bin/bash

## Install
conda install autoconf automake libtool gettext pkg-config yaggo gcc bioconda::yaggo

## Get base directory
base_dir=$(pwd)

wget -O tools/analysis/jellyfish-2.3.1.tar.gz https://github.com/gmarcais/Jellyfish/releases/download/v2.3.1/jellyfish-2.3.1.tar.gz
tar -xzvf tools/analysis/jellyfish-2.3.1.tar.gz -C tools/analysis/

cd tools/analysis/jellyfish-2.3.1 || exit
./configure --prefix=$HOME
make -j 4
make install


cd "$base_dir" || exit
find ./tools/analysis/jellyfish*/bin/ -maxdepth 1 -name "jellyfish" -type f -print > code/analysis/path_analyzer/jellyfish.txt || echo 'Jellyfish not installed'