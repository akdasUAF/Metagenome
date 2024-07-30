#!/bin/bash

conda install gcc_linux-64 zlib bioconda::minipolish

cd tools/assemblers/ || exit

# Install minimap and miniasm (requiring gcc and zlib)
git clone https://github.com/lh3/minimap2 && cd minimap2 && make
git clone https://github.com/lh3/miniasm && cd miniasm && make

