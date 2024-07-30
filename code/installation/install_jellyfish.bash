#!/bin/bash

## Install
conda install autoconf automake libtool gettext pkg-config yaggo gcc bioconda::yaggo


wget -O tools/analysis/jellyfish-2.3.1.tar.gz https://github.com/gmarcais/Jellyfish/releases/download/v2.3.1/jellyfish-2.3.1.tar.gz
tar -xzvf tools/analysis/jellyfish-2.3.1.tar.gz -C tools/analysis/

cd tools/analysis/jellyfish-2.3.1 || exit
./configure --prefix=$HOME
make -j 4
make install

