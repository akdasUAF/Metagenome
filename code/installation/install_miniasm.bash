#!/bin/bash

conda install gcc_linux-64 zlib bioconda::minipolish

## Get base directory
base_dir=$(pwd)

cd tools/assemblers/ || exit

# Install minimap and miniasm (requiring gcc and zlib)
git clone https://github.com/lh3/minimap2 && cd minimap2 && make
git clone https://github.com/lh3/miniasm && cd miniasm && make


cd "$base_dir" || exit

find ./tools/assemblers/minimap2 -maxdepth 2 -name "minimap2" -type f -print > code/assembly/path_assembler/minimap.txt || echo 'Minimap not installed'
find ./tools/assemblers/miniasm -maxdepth 2 -name "miniasm" -type f -print > code/assembly/path_assembler/miniasm.txt || echo 'Miniasm not installed'
echo "minipolish" > code/assembly/path_assembly/minipolish.txt

