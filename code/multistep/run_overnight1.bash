#!/bin/bash

function install_tool() {
  local tool_name="$1"
  local script_path="$2"

  echo "Installing $tool_name..."
  bash "$script_path"
  if [ $? -ne 0 ]; then
    echo "Error installing $tool_name"
  fi
}

install_tool "megahit sr-gut" "code/assembly/megahit/run_scripts/run_megahit_sr-gut.sh"
install_tool "megahit sr-diabetes" "code/assembly/megahit/run_scripts/run_megahit_sr-diabetes.sh"
install_tool "megahit sr-marine_sediment" "code/assembly/megahit/run_scripts/run_megahit_sr-marine_sediment.sh"

install_tool "abyss sr-marine_sediment" "code/assembly/abyss/run_scripts/run_abyss_sr-marine_sediment.sh"

install_tool "metaspades sr-diabetes" "code/assembly/metaspades/run_scripts/run_metaspades_sr-diabetes.sh"

install_tool "flye lr-soil" "code/assembly/flye/run_scripts/run_flye_lr-soil.sh"
install_tool "flye lr-ecoli" "code/assembly/flye/run_scripts/run_flye_lr-ecoli.sh"

install_tool "raven lr-soil" "code/assembly/raven/run_scripts/run_flye_lr-soil.sh"
install_tool "raven lr-ecoli" "code/assembly/raven/run_scripts/run_flye_lr-ecoli.sh"

install_tool "canu lr-soil" "code/assembly/canu/run_scripts/run_canu_lr-soil.sh"
install_tool "canu lr-marine_sediment" "code/assembly/canu/run_scripts/run_canu_lr-marine_sediment.sh"
install_tool "canu lr-gut" "code/assembly/canu/run_scripts/run_canu_lr-gut.sh"
install_tool "canu lr-ecoli" "code/assembly/canu/run_scripts/run_canu_lr-ecoli.sh"





