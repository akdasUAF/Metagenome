#!/bin/bash

./tools/processing/gfastats/build/bin/gfastats data/process/miniasm/lr-soil/polished_assembly_minimap_lr-soil.gfa -o data/process/miniasm/lr-soil/polished_assembly_minimap_lr-soil.fa


awk '/^S/{print ">"$2"\n"$3}' data/process/miniasm/lr-gut/polished_assembly_minimap_lr-gut.gfa | fold > data/process/miniasm/lr-gut/polished_assembly_minimap_lr-gut.fa

awk '/^S/{header=">"$2; for(i=4; i<=NF; i++) {header=header" "$i}; print header; printf "%s", $3 | "fold -w 80"; close("fold -w 80"); print ""}' data/MAG/miniasm/lr-gut/polished_assembly_minimap_lr-gut.gfa > data/process/miniasm/lr-gut/polished_assembly_minimap_lr-gut.fasta