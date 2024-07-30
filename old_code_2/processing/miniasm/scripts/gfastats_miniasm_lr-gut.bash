#!/bin/bash

./tools/processing/gfastats/build/bin/gfastats data/process/miniasm/lr-soil/polished_assembly_minimap_lr-soil.gfa -o data/process/miniasm/lr-soil/polished_assembly_minimap_lr-soil.fa


awk '/^S/{print ">"$2"\n"$3}' data/process/miniasm/lr-gut/polished_assembly_minimap_lr-gut.gfa | fold > data/process/miniasm/lr-gut/polished_assembly_minimap_lr-gut.fa