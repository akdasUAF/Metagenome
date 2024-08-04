#!/bin/bash

config_file="code/retrieve_datasets/reference/FETCH_config/all.config"
declare -A config_files

while IFS='=' read -r key value; do
  config_files[$key]="$value"
done < "$config_file"


# Function to switch config file
function switch_config() {
  config_name="$1"

  # Find the config file path based on the config name
  config_file=$(for config in "${config_files[@]}"; do
    key=$(echo "$config" | cut -d '=' -f 1)
    value=$(echo "$config" | cut -d '=' -f 2)
    if [[ "$key" == "$config_name" ]]; then
      echo "$value"
      break
    fi
  done)

  if [ -z "$config_file" ]; then
    echo "Error: Config name not found."
    exit 1
  fi

  # Construct the target config path
  target_config="tools/retrieval/FETCH/ncbifetcher.config"

  # Create a backup of the current config file
  backup_file="${target_config}.bak"
  cp "$target_config" "$backup_file" 2>/dev/null

  # Create a symbolic link to the new config file
  ln -sf "$config_file" "$target_config"

  echo "Config file switched to: $config_file"
}

# Function to restore the original config file
function reset_config() {
  target_config_dir="code/retrieve_datasets/reference/"
  target_config="$target_config_dir/config"
  backup_file="${target_config}.bak"

  # Check if backup exists
  if [ -f "$backup_file" ]; then
    # Restore the original config file
    cp "$backup_file" "$target_config"

    # Remove the backup file
    rm "$backup_file"

    echo "Config file restored to original"
  else
    echo "No backup found."
  fi
}

# Example usage:
# switch_config "sr_bsc"
# reset_config
