#!/bin/bash

### Install Dependencies
conda install -c bioconda -c conda-forge abyss
echo "abyss-pe" > code/assembly/path_assembler/abyss.txt || echo 'Abyss not installed'