#!/bin/env bash

if [ $# -ne 4 ]; then
  echo "Usage: $0 <path_contigs> <path_output> <path_reference> <path_log>"
  echo $#
  echo $1
  echo $2
  echo $3
  exit 1
fi

path_contigs=$1
path_output=$2
path_reference=$3
path_log=$4


bash_to_run="code/analysis/metaquast/metaquast.bash $path_contigs $path_output $path_reference"
echo "${bash_to_run}"

conda run -n ana_metaquast $bash_to_run | tee $path_log


