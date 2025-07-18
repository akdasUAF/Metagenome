
# Canu
for dir in data/canu/*/ ; do base_dir=$(basename "$dir"); cp "${dir}${base_dir}_task.contigs.fasta" "metagenome_results_full/canu/${base_dir}/assembly/"; echo "Copied ${dir}${base_dir}_task.contigs.fasta to metagenome_results_full/canu/${base_dir}/assembly/"; done
# Make 
mkdir -p metagenome_results_full/canu/lr-even/assembly \
         metagenome_results_full/canu/lr-log/assembly \
         metagenome_results_full/canu/lr-ms/assembly \
         metagenome_results_full/flye/lr-even/assembly \
         metagenome_results_full/flye/lr-log/assembly \
         metagenome_results_full/flye/lr-ms/assembly \
         metagenome_results_full/miniasm/lr-even/assembly \
         metagenome_results_full/miniasm/lr-log/assembly \
         metagenome_results_full/miniasm/lr-ms/assembly \
         metagenome_results_full/raven/lr-even/assembly \
         metagenome_results_full/raven/lr-log/assembly \
         metagenome_results_full/raven/lr-ms/assembly \
         metagenome_results_full/metaspades/sr-even/assembly \
         metagenome_results_full/metaspades/sr-log/assembly \
         metagenome_results_full/metaspades/sr-ms/assembly \
         metagenome_results_full/megahit/sr-even/assembly \
         metagenome_results_full/megahit/sr-log/assembly \
         metagenome_results_full/megahit/sr-ms/assembly \
         metagenome_results_full/unicycler/sr-even/assembly \
         metagenome_results_full/unicycler/sr-log/assembly \
         metagenome_results_full/unicycler/sr-ms/assembly




cp canu/lr-even/lr-even_task.contigs.fasta metagenome_results_full/canu/lr-even/assembly/; cp canu/lr-even/lr-even_task.report metagenome_results_full/canu/lr-even/assembly/; cp canu/lr-even/lr-even_task.trimmedReads.fasta.gz metagenome_results_full/canu/lr-even/assembly/; cp -r canu/lr-even/canu-logs/ metagenome_results_full/canu/lr-even/assembly/

cp canu/lr-log/lr-log_task.contigs.fasta metagenome_results_full/canu/lr-log/assembly/; cp canu/lr-log/lr-log_task.report metagenome_results_full/canu/lr-log/assembly/; cp canu/lr-log/lr-log_task.trimmedReads.fasta.gz metagenome_results_full/canu/lr-log/assembly/; cp -r canu/lr-log/canu-logs/ metagenome_results_full/canu/lr-log/assembly/

cp canu/lr-ms/lr-ms_task.contigs.fasta metagenome_results_full/canu/lr-ms/assembly/; cp canu/lr-ms/lr-ms_task.report metagenome_results_full/canu/lr-ms/assembly/; cp canu/lr-ms/lr-ms_task.trimmedReads.fasta.gz metagenome_results_full/canu/lr-ms/assembly/; cp -r canu/lr-ms/canu-logs/ metagenome_results_full/canu/lr-ms/assembly/


# Raven
cp raven/lr-even/assembly*.fasta metagenome_results_full/raven/lr-even/assembly/

cp raven/lr-log/assembly*.fasta metagenome_results_full/raven/lr-log/assembly/

cp raven/lr-ms/assembly*.fasta metagenome_results_full/raven/lr-ms/assembly/


## Flye
cp flye/lr-even/assembly.fasta metagenome_results_full/flye/lr-even/assembly/; cp flye/lr-even/flye.log metagenome_results_full/flye/lr-even/assembly/; cp flye/lr-even/params.json metagenome_results_full/flye/lr-even/assembly/; cp flye/lr-even/assembly_info.txt metagenome_results_full/flye/lr-even/assembly/

cp flye/lr-log/assembly.fasta metagenome_results_full/flye/lr-log/assembly/; cp flye/lr-log/flye.log metagenome_results_full/flye/lr-log/assembly/; cp flye/lr-log/params.json metagenome_results_full/flye/lr-log/assembly/; cp flye/lr-log/assembly_info.txt metagenome_results_full/flye/lr-log/assembly/

cp flye/lr-log/assembly.fasta metagenome_results_full/flye/lr-log/assembly/; cp flye/lr-log/flye.log metagenome_results_full/flye/lr-log/assembly/; cp flye/lr-log/params.json metagenome_results_full/flye/lr-log/assembly/; cp flye/lr-log/assembly_info.txt metagenome_results_full/flye/lr-log/assembly/

## Megahit
cp megahit/sr-even/final.contigs.fa metagenome_results_full/megahit/sr-even/assembly/; cp megahit/sr-even/log metagenome_results_full/megahit/sr-even/assembly/; cp megahit/sr-even/options.json metagenome_results_full/megahit/sr-even/assembly/; cp megahit/sr-even/checkpoints.txt metagenome_results_full/megahit/sr-even/assembly/

cp megahit/sr-log/final.contigs.fa metagenome_results_full/megahit/sr-log/assembly/; cp megahit/sr-log/log metagenome_results_full/megahit/sr-log/assembly/; cp megahit/sr-log/options.json metagenome_results_full/megahit/sr-log/assembly/; cp megahit/sr-log/checkpoints.txt metagenome_results_full/megahit/sr-log/assembly/

cp megahit/sr-ms/final.contigs.fa metagenome_results_full/megahit/sr-ms/assembly/; cp megahit/sr-ms/log metagenome_results_full/megahit/sr-ms/assembly/; cp megahit/sr-ms/options.json metagenome_results_full/megahit/sr-ms/assembly/; cp megahit/sr-ms/checkpoints.txt metagenome_results_full/megahit/sr-ms/assembly/

cp megahit/cami-medium/final.contigs.fa metagenome_results_full/megahit/cami-medium/assembly/; cp megahit/cami-medium/log metagenome_results_full/megahit/cami-medium/assembly/; cp megahit/cami-medium/options.json metagenome_results_full/megahit/cami-medium/assembly/; cp megahit/cami-medium/checkpoints.txt metagenome_results_full/megahit/cami-medium/assembly/

cp megahit/cami-low/final.contigs.fa metagenome_results_full/megahit/cami-low/assembly/; cp megahit/cami-low/log metagenome_results_full/megahit/cami-low/assembly/; cp megahit/cami-low/options.json metagenome_results_full/megahit/cami-low/assembly/; cp megahit/cami-low/checkpoints.txt metagenome_results_full/megahit/cami-low/assembly/

cp megahit/cami-high/final.contigs.fa metagenome_results_full/megahit/cami-high/assembly/; cp megahit/cami-high/log metagenome_results_full/megahit/cami-high/assembly/; cp megahit/cami-high/options.json metagenome_results_full/megahit/cami-high/assembly/; cp megahit/cami-high/checkpoints.txt metagenome_results_full/megahit/cami-high/assembly/



### MetaSPAdes
cp metaspades/sr-even/scaffolds.fasta metagenome_results_full/metaspades/sr-even/assembly/; cp metaspades/sr-even/scaffolds.paths metagenome_results_full/metaspades/sr-even/assembly/; cp metaspades/sr-even/spades.log metagenome_results_full/metaspades/sr-even/assembly/; cp metaspades/sr-even/params.txt metagenome_results_full/metaspades/sr-even/assembly/; cp metaspades/sr-even/dataset.info metagenome_results_full/metaspades/sr-even/assembly/; cp metaspades/sr-even/contigs.paths metagenome_results_full/metaspades/sr-even/assembly/; cp metaspades/sr-even/contigs.fasta metagenome_results_full/metaspades/sr-even/assembly/

cp metaspades/sr-log/scaffolds.fasta metagenome_results_full/metaspades/sr-log/assembly/; cp metaspades/sr-log/scaffolds.paths metagenome_results_full/metaspades/sr-log/assembly/; cp metaspades/sr-log/spades.log metagenome_results_full/metaspades/sr-log/assembly/; cp metaspades/sr-log/params.txt metagenome_results_full/metaspades/sr-log/assembly/; cp metaspades/sr-log/dataset.info metagenome_results_full/metaspades/sr-log/assembly/; cp metaspades/sr-log/contigs.paths metagenome_results_full/metaspades/sr-log/assembly/; cp metaspades/sr-log/contigs.fasta metagenome_results_full/metaspades/sr-log/assembly/

cp metaspades/sr-ms/scaffolds.fasta metagenome_results_full/metaspades/sr-ms/assembly/; cp metaspades/sr-ms/scaffolds.paths metagenome_results_full/metaspades/sr-ms/assembly/; cp metaspades/sr-ms/spades.log metagenome_results_full/metaspades/sr-ms/assembly/; cp metaspades/sr-ms/params.txt metagenome_results_full/metaspades/sr-ms/assembly/; cp metaspades/sr-ms/dataset.info metagenome_results_full/metaspades/sr-ms/assembly/; cp metaspades/sr-ms/contigs.paths metagenome_results_full/metaspades/sr-ms/assembly/; cp metaspades/sr-ms/contigs.fasta metagenome_results_full/metaspades/sr-ms/assembly/

cp metaspades/cami-medium/scaffolds.fasta metagenome_results_full/metaspades/cami-medium/assembly/; cp metaspades/cami-medium/scaffolds.paths metagenome_results_full/metaspades/cami-medium/assembly/; cp metaspades/cami-medium/spades.log metagenome_results_full/metaspades/cami-medium/assembly/; cp metaspades/cami-medium/params.txt metagenome_results_full/metaspades/cami-medium/assembly/; cp metaspades/cami-medium/dataset.info metagenome_results_full/metaspades/cami-medium/assembly/; cp metaspades/cami-medium/contigs.paths metagenome_results_full/metaspades/cami-medium/assembly/; cp metaspades/cami-medium/contigs.fasta metagenome_results_full/metaspades/cami-medium/assembly/

cp metaspades/cami-low/scaffolds.fasta metagenome_results_full/metaspades/cami-low/assembly/; cp metaspades/cami-low/scaffolds.paths metagenome_results_full/metaspades/cami-low/assembly/; cp metaspades/cami-low/spades.log metagenome_results_full/metaspades/cami-low/assembly/; cp metaspades/cami-low/params.txt metagenome_results_full/metaspades/cami-low/assembly/; cp metaspades/cami-low/dataset.info metagenome_results_full/metaspades/cami-low/assembly/; cp metaspades/cami-low/contigs.paths metagenome_results_full/metaspades/cami-low/assembly/; cp metaspades/cami-low/contigs.fasta metagenome_results_full/metaspades/cami-low/assembly/

cp metaspades/cami-high/scaffolds.fasta metagenome_results_full/metaspades/cami-high/assembly/; cp metaspades/cami-high/scaffolds.paths metagenome_results_full/metaspades/cami-high/assembly/; cp metaspades/cami-high/spades.log metagenome_results_full/metaspades/cami-high/assembly/; cp metaspades/cami-high/params.txt metagenome_results_full/metaspades/cami-high/assembly/; cp metaspades/cami-high/dataset.info metagenome_results_full/metaspades/cami-high/assembly/; cp metaspades/cami-high/contigs.paths metagenome_results_full/metaspades/cami-high/assembly/; cp metaspades/cami-high/contigs.fasta metagenome_results_full/metaspades/cami-high/assembly/


### Unicycler
cp unicycler/sr-even/assembly.fasta metagenome_results_full/unicycler/sr-even/assembly/; cp unicycler/sr-even/assembly.gfa metagenome_results_full/unicycler/sr-even/assembly/; cp unicycler/sr-even/unicycler.log metagenome_results_full/unicycler/sr-even/assembly/

cp unicycler/sr-log/assembly.fasta metagenome_results_full/unicycler/sr-log/assembly/; cp unicycler/sr-log/assembly.gfa metagenome_results_full/unicycler/sr-log/assembly/; cp unicycler/sr-log/unicycler.log metagenome_results_full/unicycler/sr-log/assembly/

cp unicycler/sr-ms/assembly.fasta metagenome_results_full/unicycler/sr-ms/assembly/; cp unicycler/sr-ms/assembly.gfa metagenome_results_full/unicycler/sr-ms/assembly/; cp unicycler/sr-ms/unicycler.log metagenome_results_full/unicycler/sr-ms/assembly/

cp unicycler/cami-medium/assembly.fasta metagenome_results_full/unicycler/cami-medium/assembly/; cp unicycler/cami-medium/assembly.gfa metagenome_results_full/unicycler/cami-medium/assembly/; cp unicycler/cami-medium/unicycler.log metagenome_results_full/unicycler/cami-medium/assembly/

cp unicycler/cami-low/assembly.fasta metagenome_results_full/unicycler/cami-low/assembly/; cp unicycler/cami-low/assembly.gfa metagenome_results_full/unicycler/cami-low/assembly/; cp unicycler/cami-low/unicycler.log metagenome_results_full/unicycler/cami-low/assembly/

cp unicycler/cami-high/assembly.fasta metagenome_results_full/unicycler/cami-high/assembly/; cp unicycler/cami-high/assembly.gfa metagenome_results_full/unicycler/cami-high/assembly/; cp unicycler/cami-high/unicycler.log metagenome_results_full/unicycler/cami-high/assembly/







mkdir -p metagenome_results_full/canu/logs/ \
         metagenome_results_full/flye/logs/ \
         metagenome_results_full/raven/logs/ \
         metagenome_results_full/megahit/logs/ \
         metagenome_results_full/metaspades/logs/ \
         metagenome_results_full/unicycler/logs/


# For Canu
cp -r canu/logs/ metagenome_results_full/canu/logs/

# For Flye
cp -r flye/logs/ metagenome_results_full/flye/logs/

# For Raven
cp -r raven/logs/ metagenome_results_full/raven/logs/

# For MegaHit
cp -r megahit/logs/ metagenome_results_full/megahit/logs/

# For MetaSPAdes
cp -r metaspades/logs/ metagenome_results_full/metaspades/logs/

# For Unicycler
cp -r unicycler/logs/ metagenome_results_full/unicycler/logs/

















#!/bin/bash

# Define all your dataset names for both long and short reads
ALL_DATASETS=(
    "lr-even" "lr-log" "lr-ms" "lr-bd" 
    "sr-even" "sr-log" "sr-ms" 
    "cami-medium" "cami-low" "cami-high"
)

# Define the destination directory
DEST_DIR="metagenome_results_full/megahit/logs_other/"

# 1. Create the destination directory if it doesn't exist
echo "Creating destination directory: $DEST_DIR"
mkdir -p "$DEST_DIR"

# 2. Loop through each dataset and copy MegaHit logs
echo "Starting log file copy for MegaHit..."
for dataset in "${ALL_DATASETS[@]}"; do
    SOURCE_DIR="logs/${dataset}/megahit/"
    
    # Check if the source directory exists before trying to copy from it
    if [ -d "$SOURCE_DIR" ]; then
        echo "Processing dataset: $dataset (from $SOURCE_DIR)"
        # Copy all files from the source directory to the single destination directory
        # -v provides verbose output, showing what is being copied
        cp -v "${SOURCE_DIR}"* "${DEST_DIR}"
    else
        echo "Skipping: Source directory '$SOURCE_DIR' not found. It might not exist for this dataset or assembler."
    fi
done

echo "MegaHit log copy complete."


#!/bin/bash

# Define all your dataset names for both long and short reads
ALL_DATASETS=(
    "lr-even" "lr-log" "lr-ms" "lr-bd"
    "sr-even" "sr-log" "sr-ms"
    "cami-medium" "cami-low" "cami-high"
)

# Define the destination directory for MetaSPAdes logs
DEST_DIR="metagenome_results_full/metaspades/logs_other/"

# 1. Create the destination directory if it doesn't exist
echo "Creating destination directory: $DEST_DIR"
mkdir -p "$DEST_DIR"

# 2. Loop through each dataset and copy MetaSPAdes logs
echo "Starting log file copy for MetaSPAdes..."
for dataset in "${ALL_DATASETS[@]}"; do
    SOURCE_DIR="logs/${dataset}/metaspades/" # Changed 'megahit' to 'metaspades'
    
    # Check if the source directory exists before trying to copy from it
    if [ -d "$SOURCE_DIR" ]; then
        echo "Processing dataset: $dataset (from $SOURCE_DIR)"
        # Copy all files from the source directory to the single destination directory
        # -v provides verbose output, showing what is being copied
        cp -v "${SOURCE_DIR}"* "${DEST_DIR}"
    else
        echo "Skipping: Source directory '$SOURCE_DIR' not found. It might not exist for this dataset or assembler."
    fi
done

echo "MetaSPAdes log copy complete."



### Unicycler

#!/bin/bash

# Define all your dataset names for both long and short reads
ALL_DATASETS=(
    "lr-even" "lr-log" "lr-ms" "lr-bd"
    "sr-even" "sr-log" "sr-ms"
    "cami-medium" "cami-low" "cami-high"
)

# Define the destination directory for Unicycler logs
DEST_DIR="metagenome_results_full/unicycler/logs_other/" # Changed to unicycler and logs_other

# 1. Create the destination directory if it doesn't exist
echo "Creating destination directory: $DEST_DIR"
mkdir -p "$DEST_DIR"

# 2. Loop through each dataset and copy Unicycler logs
echo "Starting log file copy for Unicycler..."
for dataset in "${ALL_DATASETS[@]}"; do
    SOURCE_DIR="logs/${dataset}/unicycler/" # Changed to unicycler
    
    # Check if the source directory exists before trying to copy from it
    if [ -d "$SOURCE_DIR" ]; then
        echo "Processing dataset: $dataset (from $SOURCE_DIR)"
        # Copy all files from the source directory to the single destination directory
        # -v provides verbose output, showing what is being copied
        cp -v "${SOURCE_DIR}"* "${DEST_DIR}"
    else
        echo "Skipping: Source directory '$SOURCE_DIR' not found. It might not exist for this dataset or assembler."
    fi
done

echo "Unicycler log copy complete."



### Canu

#!/bin/bash

# Define all your dataset names for both long and short reads
ALL_DATASETS=(
    "lr-even" "lr-log" "lr-ms" "lr-bd"
    "sr-even" "sr-log" "sr-ms"
    "cami-medium" "cami-low" "cami-high"
)

# Define the destination directory for Canu logs
DEST_DIR="metagenome_results_full/canu/logs_other/" # Changed to canu and logs_other

# 1. Create the destination directory if it doesn't exist
echo "Creating destination directory: $DEST_DIR"
mkdir -p "$DEST_DIR"

# 2. Loop through each dataset and copy Canu logs
echo "Starting log file copy for Canu..."
for dataset in "${ALL_DATASETS[@]}"; do
    SOURCE_DIR="logs/${dataset}/canu/" # Changed to canu
    
    # Check if the source directory exists before trying to copy from it
    if [ -d "$SOURCE_DIR" ]; then
        echo "Processing dataset: $dataset (from $SOURCE_DIR)"
        # Copy all files from the source directory to the single destination directory
        # -v provides verbose output, showing what is being copied
        cp -v "${SOURCE_DIR}"* "${DEST_DIR}"
    else
        echo "Skipping: Source directory '$SOURCE_DIR' not found. It might not exist for this dataset or assembler."
    fi
done

echo "Canu log copy complete."




## Raven

#!/bin/bash

# Define all your dataset names for both long and short reads
ALL_DATASETS=(
    "lr-even" "lr-log" "lr-ms" "lr-bd"
    "sr-even" "sr-log" "sr-ms"
    "cami-medium" "cami-low" "cami-high"
)

# Define the destination directory for Raven logs
DEST_DIR="metagenome_results_full/raven/logs_other/" # Changed to raven and logs_other

# 1. Create the destination directory if it doesn't exist
echo "Creating destination directory: $DEST_DIR"
mkdir -p "$DEST_DIR"

# 2. Loop through each dataset and copy Raven logs
echo "Starting log file copy for Raven..."
for dataset in "${ALL_DATASETS[@]}"; do
    SOURCE_DIR="logs/${dataset}/raven/" # Changed to raven
    
    # Check if the source directory exists before trying to copy from it
    if [ -d "$SOURCE_DIR" ]; then
        echo "Processing dataset: $dataset (from $SOURCE_DIR)"
        # Copy all files from the source directory to the single destination directory
        # -v provides verbose output, showing what is being copied
        cp -v "${SOURCE_DIR}"* "${DEST_DIR}"
    else
        echo "Skipping: Source directory '$SOURCE_DIR' not found. It might not exist for this dataset or assembler."
    fi
done

echo "Raven log copy complete."


## Flye
#!/bin/bash

# Define all your dataset names for both long and short reads
ALL_DATASETS=(
    "lr-even" "lr-log" "lr-ms" "lr-bd"
    "sr-even" "sr-log" "sr-ms"
    "cami-medium" "cami-low" "cami-high"
)

# Define the destination directory for Flye logs
DEST_DIR="metagenome_results_full/flye/logs_other/" # Changed to flye and logs_other

# 1. Create the destination directory if it doesn't exist
echo "Creating destination directory: $DEST_DIR"
mkdir -p "$DEST_DIR"

# 2. Loop through each dataset and copy Flye logs
echo "Starting log file copy for Flye..."
for dataset in "${ALL_DATASETS[@]}"; do
    SOURCE_DIR="logs/${dataset}/flye/" # Changed to flye
    
    # Check if the source directory exists before trying to copy from it
    if [ -d "$SOURCE_DIR" ]; then
        echo "Processing dataset: $dataset (from $SOURCE_DIR)"
        # Copy all files from the source directory to the single destination directory
        # -v provides verbose output, showing what is being copied
        cp -v "${SOURCE_DIR}"* "${DEST_DIR}"
    else
        echo "Skipping: Source directory '$SOURCE_DIR' not found. It might not exist for this dataset or assembler."
    fi
done

echo "Flye log copy complete."