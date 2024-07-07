#!/bin/bash

### Install Dependencies
conda install pkg-config matplotlib

git clone git@github.com:ablab/quast.git
conda install -c bioconda quast