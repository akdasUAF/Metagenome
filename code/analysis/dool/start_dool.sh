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

# Run dool in the background with user-provided filename
## Runs these settings:
# -afr: all
bash code/analysis/dool/dool_scripts/dool_afr.sh "$path"_dool-afr.log
# --aio:
bash code/analysis/dool/dool_scripts/dool_aio.sh "$path"_dool-aio.log
# -s:

# --cpufreq 
bash code/analysis/dool/dool_scripts/dool_cpufreq.sh "$path"_dool-cpufreq.log
# --disk-avgqu 
bash code/analysis/dool/dool_scripts/dool_disk-avgqu.sh "$path"_disk-avgqu.log
# --disk-avgrq 
bash code/analysis/dool/dool_scripts/dool_avgrq.sh "$path"_dool-avgrq.log
# --disk-inflight 
bash code/analysis/dool/dool_scripts/dool_disk-inflight.sh "$path"_dool-disk-inflight.log
# --disk-svctm 
bash code/analysis/dool/dool_scripts/dool_svctm.sh "$path"_dool-svctm.log
# --disk-util 
bash code/analysis/dool/dool_scripts/dool_disk-util.sh "$path"_dool-disk-util.log
# --mem-percent 
bash code/analysis/dool/dool_scripts/dool_mem-percent.sh "$path"_dool-mempercent.log

#dool -afr --aio --fs --ipc --socket --tcp --unix --vm --vm-adv --zones --cpufreq --disk-avgqu --disk-avgrq --disk-inflight --disk-svctm --disk-util --mem-percent --output "$path" &



# Capture the background process PID
pid=$!

# Store the PID in a file (replace /tmp/dool.pid with your chosen location)
echo $pid > /tmp/dool.pid

### Buffer of 10 seconds to capture baseline system processes before capturing tool metrics
sleep 10


