#!/bin/bash

conda install cmake zlib clang

cd tools/assemblers/ || exit
git clone https://github.com/lbcb-sci/raven && cd raven || exit

cmake -S ./ -B./build -DRAVEN_BUILD_EXE=1 -DCMAKE_BUILD_TYPE=Release
cmake --build build
cmake --install ./build

