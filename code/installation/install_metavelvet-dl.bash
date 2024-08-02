#!/bin/bash

conda install tensorflow keras numpy zlib gcc_linux-64 bzip2 libcurl libdeflate autoconf make automake matplotlib-base
conda install -c bioconda samtools
conda install -c bioconda dwgsim
conda install -c bioconda metavelvet
conda install -c bioconda libsvm
conda install -c bioconda MetaPhlAn

conda install matplotlib-base pysam libzlib libgcc-ng zlib libdeflate libcurl r-rbiom

mkdir -p tools/assembly/metavelvet-dl/ && cd tools/assembly/metavelvet-dl/ || exit

path_mvtop=$(pwd)


### Installing htslib
git clone https://github.com/samtools/htslib.git
cd htslib/
git submodule update --init --recursive
autoreconf -i
./configure
make



### Installing dwgsim & SAMTOOLS
cd "$path_mvtop"
mkdir -p "$path_mvtop"/dependencies/samtools/
wget https://github.com/samtools/samtools/releases/download/1.20/samtools-1.20.tar.bz2
tar -xvjf samtools-1.20.tar.bz2
cd samtools-1.20/
./configure --prefix="$path_mvtop"/dependencies/samtools/
make



### Installing velvet
wget -O velvet_v1.2.10.tar.gz https://github.com/dzerbino/velvet/archive/refs/tags/v1.2.10.tar.gz
tar zxvf velvet_v1.2.10.tar.gz
cd velvet-1.2.10/
make color

https://github.com/nh13/DWGSIM.git
cd DWGSIM/
make




wget http://metavelvet.dna.bio.keio.ac.jp/srcSL/LearningModelFeatures.tar.gz
wget http://metavelvet.dna.bio.keio.ac.jp/srcSL/MetaVelvetSLv1.0.tar.gz

tar zxvf MetaVelvetSLv1.0.tar.gz

cd MetaVelvetSLv1.0/
make ['MAXKMERLENGTH = 31'] ['CATEGORIES = 2']

cd "$path_mvtop"

