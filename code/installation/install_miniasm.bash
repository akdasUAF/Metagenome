#!/bin/bash

conda install gcc_linux-64 zlib bioconda::minipolish

cd tools/assemblers/ || exit

# Install minimap and miniasm (requiring gcc and zlib)
curl -L https://github.com/lh3/minimap2/releases/download/v2.28/minimap2-2.28_x64-linux.tar.bz2 | tar -jxvf -
mv minimap2-2.28_x64-linux/ minimap2

git clone https://github.com/lh3/miniasm && cd miniasm && make

