#!/bin/bash

conda install gcc_linux-64 zlib bioconda::minipolish

cd tools/assemblers/ || exit

path_assemblers=$(pwd)

# Install minimap and miniasm (requiring gcc and zlib)
git clone https://github.com/lh3/minimap2 && cd minimap2 && make
cd "$path_assemblers"

git clone https://github.com/lh3/miniasm && cd miniasm && make

