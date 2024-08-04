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

install_tool "BUSCO" "code/installation/run_scripts/run_install_busco.bash"
install_tool "DOOL" "code/installation/run_scripts/run_install_dool.bash"
install_tool "METAQUAST" "code/installation/run_scripts/run_install_metaquast.bash"

echo "Finished installing all analyzers...."

