#!/bin/bash

## Assembler: MEGAHIT

## Store path for installation
install_path = $1

## Install dependencies using conda
conda install cmake zlib bz2file conda-forge::m2-libbz2

## Change directory to user input
cd $install_path
wget https://github.com/ablab/spades/releases/download/v4.0.0/SPAdes-4.0.0-Linux.tar.gz

## Unzip tar.gz
tar -xvzf SPAdes-4.0.0-Linux.tar.gz

## Compile spades
cd SPAdes-4.0.0-Linux/
./spades_compile.sh

## Echo output path to use for 

