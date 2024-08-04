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

install_tool "Abyss" "code/installation/run_scripts/run_install_abyss.bash"
install_tool "Canu" "code/installation/run_scripts/run_install_canu.bash"
install_tool "Flye" "code/installation/run_scripts/run_install_flye.bash"
install_tool "MegaHit" "code/installation/run_scripts/run_install_megahit.bash"
install_tool "MetaSPAdes" "code/installation/run_scripts/run_install_metaspades.bash"
install_tool "Miniasm" "code/installation/run_scripts/run_install_miniasm.bash"
install_tool "Raven" "code/installation/run_scripts/run_install_raven.bash"

echo "Finished installing all Assemblers...."
