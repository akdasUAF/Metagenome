#!/bin/bash


### Install Dependencies
conda install cmake zlib clang
conda install openssl libcurl liblzma

## Get base directory
base_dir=$(pwd)

cd tools/assemblers/ || exit
curl -L https://github.com/marbl/canu/releases/download/v2.2/canu-2.2.Linux-amd64.tar.xz --output canu-2.2.Linux.tar.xz 

tar -xJf canu-2.2.*.tar.xz

cd "$base_dir" || exit
find ./tools/assemblers/canu-2*/bin/ -name "canu" -type f -print > code/assembly/path_assemblers/canu.txt  || echo 'Canu not installed'