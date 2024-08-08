#!/bin/bash

# Check if at least one argument is provided
if [[ $# -eq 0 ]]; then
  echo "Error: Please provide a path as an argument."
  exit 1
fi

# Check if filename is empty, use default if so
path="$1"
mkdir -p "$(dirname "$path")"

# Delete the file if it exists
[[ -f "$path" ]] && rm "$path"

# # Run dool in the background with user-provided filename
# ## Runs these settings:
# # -afr: all
# bash code/analysis/dool/dool_scripts/dool_afr.sh "$path"_dool-afr.csv
# # --aio:
# bash code/analysis/dool/dool_scripts/dool_aio.sh "$path"_dool-aio.csv
# # -s:

# # --cpufreq 
# bash code/analysis/dool/dool_scripts/dool_cpufreq.sh "$path"_dool-cpufreq.csv
# # --disk-avgqu 
# bash code/analysis/dool/dool_scripts/dool_disk-avgqu.sh "$path"_dool_disk-avgqu.csv
# # --disk-avgrq 
# bash code/analysis/dool/dool_scripts/dool_disk-avgrq.sh "$path"_dool-avgrq.csv
# # --disk-inflight 
# bash code/analysis/dool/dool_scripts/dool_disk-inflight.sh "$path"_dool-disk-inflight.csv
# # --disk-svctm 
# bash code/analysis/dool/dool_scripts/dool_disk-svctm.sh "$path"_dool-svctm.csv
# # --disk-util 
# bash code/analysis/dool/dool_scripts/dool_disk-util.sh "$path"_dool-disk-util.csv
# # --mem-percent 
# bash code/analysis/dool/dool_scripts/dool_mem-percent.sh "$path"_dool-mempercent.csv

# Full command 
#dool -afr --aio --fs --ipc --socket --tcp --unix --vm --vm-adv --zones --cpufreq --disk-avgqu --disk-avgrq --disk-inflight --disk-svctm --disk-util --mem-percent --output "$path" &
bash code/benchmarking/scripts/dool_full.sh "$path"

## Echo that the timer is over:
echo "Timer is over: Beginning assembly"
