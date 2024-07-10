#!/bin/bash

conda activate asm_miniasm

cd tools/

# Install minimap and miniasm (requiring gcc and zlib)
git clone https://github.com/lh3/minimap2 && (cd minimap2 && make)
git clone https://github.com/lh3/miniasm  && (cd miniasm  && make)

conda deactivate asm_miniasm