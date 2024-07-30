#!/bin/bash

### Install Dependencies
conda install -c conda-forge -c bioconda busco=5.7.1
echo "busco" > code/analysis/path_analyzer/busco.txt || echo 'Busco not installed'