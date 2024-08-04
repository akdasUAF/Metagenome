#!/bin/bash

function switch_config() {
  new_config="$1"
  target_config="tools/retrieval/FETCH/ncbifetcher.config"

  # Replace the contents of the target config file
  cp "$new_config" "$target_config"

  echo "Config file contents updated: $target_config"
}
