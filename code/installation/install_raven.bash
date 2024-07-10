#!/bin/bash


conda activate asm_raven
conda install cmake zlib clang

cd tools/
git clone https://github.com/lbcb-sci/raven && cd raven

cmake -S ./ -B./build -DRAVEN_BUILD_EXE=1 -DCMAKE_BUILD_TYPE=Release

cmake --build build

cmake --install ./build



conda deactivate asm_raven