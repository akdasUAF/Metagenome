#!/bin/bash

### Install Dependencies
conda install cmake zlib bz2file conda-forge::m2-libbz2

## Get base directory
base_dir=$(pwd)

cd tools/assemblers/ || exit

## Change directory to user input
wget https://github.com/ablab/spades/releases/download/v4.0.0/SPAdes-4.0.0-Linux.tar.gz

## Unzip tar.gz
tar -xvzf SPAdes-4.0.0-Linux.tar.gz

## Compile spades
cd SPAdes-4.0.0-Linux/ || exit
./spades_compile.sh

cd "$base_dir" || exit
echo "python3 tools/assemblers/SPAdes-4.0.0-Linux/bin/metaspades.py" > code/assembly/path_assembler/metaspades.txt || echo 'Metaspades not Installed'
