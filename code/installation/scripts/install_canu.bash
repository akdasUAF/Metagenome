#!/bin/bash


### Install Dependencies
conda install cmake zlib clang
conda install openssl libcurl liblzma
cd tools/
curl -L https://github.com/marbl/canu/releases/download/v2.2/canu-2.2.Linux-amd64.tar.xz --output canu-2.2.Linux.tar.xz 

tar -xJf canu-2.2.*.tar.xz