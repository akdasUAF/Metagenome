#!/bin/bash

### Install Dependencies
conda install cmake zlib bz2file conda-forge::m2-libbz2 python=3.11

cd tools/assemblers/ || exit

## Change directory to user input
wget https://github.com/ablab/spades/releases/download/v4.0.0/SPAdes-4.0.0-Linux.tar.gz

## Unzip tar.gz
tar -xvzf SPAdes-4.0.0-Linux.tar.gz

## Compile spades
cd SPAdes-4.0.0-Linux/ || exit
./spades_compile.sh

