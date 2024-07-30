#!/bin/bash

conda install cmake zlib clang

## Get base directory
base_dir=$(pwd)

cd tools/assemblers/ || exit
git clone https://github.com/lbcb-sci/raven && cd raven || exit

cmake -S ./ -B./build -DRAVEN_BUILD_EXE=1 -DCMAKE_BUILD_TYPE=Release
cmake --build build
cmake --install ./build

cd "$base_dir" || exit
find ./tools/assemblers/raven/build/bin -maxdepth 1 -name "raven" -type f -print > code/assembly/path_assembler/raven.txt || echo 'Raven not installed'
