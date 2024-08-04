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

install_tool "FETCH" "code/installation/run_scripts/run_install_FETCH.bash"
install_tool "SRATOOLKIT" "code/installation/run_scripts/run_install_sratoolkit.bash"


echo "Finished installing all Retrieval...."