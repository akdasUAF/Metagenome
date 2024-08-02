

# Define the base directory
base_dir="data/analysis/metavelvet"

# Array of folder names
folders=("sr-diabetes" "sr-gut" "sr-bsc" "sr-marine_sediment")

# Create the folders
for folder in "${folders[@]}"
do
    mkdir -p "$base_dir/$folder"
done