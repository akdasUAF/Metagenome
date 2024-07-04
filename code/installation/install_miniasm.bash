#!/bin/bash

# Install minimap and miniasm (requiring gcc and zlib)
git clone https://github.com/lh3/minimap2 && (cd minimap2 && make)
git clone https://github.com/lh3/miniasm  && (cd miniasm  && make)

## Running 
## Overlap for PacBio reads (or use "-x ava-ont" for nanopore read overlapping)
#minimap2/minimap2 -x ava-pb -t8 pb-reads.fq pb-reads.fq | gzip -1 > reads.paf.gz
## Layout
#miniasm/miniasm -f reads.fq reads.paf.gz > reads.gfa