# Assuming 'root_for_logs' and 'generate_dool_ggplot' function are already defined
# and all your 'dool_assembler_dataset' variables are in your R environment.

# Create a list of all individual dool log configurations
all_dool_configs <- list(
  dool_megahit_sr_ms,
  dool_megahit_sr_even,
  dool_megahit_sr_log,
  dool_megahit_cami_high,
  dool_megahit_cami_medium,
  dool_megahit_cami_low,
  
  dool_metaspades_sr_ms,
  dool_metaspades_sr_even,
  dool_metaspades_sr_log,
  dool_metaspades_sr_cami_medium,
  
  dool_unicycler_sr_even,
  dool_unicycler_sr_log,
  
  dool_canu_lr_ms,
  dool_canu_lr_even,
  dool_canu_lr_log,
  
  dool_flye_lr_ms,
  dool_flye_lr_even,
  dool_flye_lr_log,
  
  dool_miniasm_lr_ms,
  
  dool_raven_lr_ms,
  dool_raven_lr_even,
  dool_raven_lr_log
)

# Loop through each configuration and generate the plot
for (config in all_dool_configs) {
  assembler_name <- config[2] # Second element is the assembler name
  dataset_name <- config[3]   # Third element is the dataset name
  
  # Construct the output directory path
  output_dir <- paste0("exploratory/dool_figures/", tolower(assembler_name), "/", dataset_name, "/")
  
  # Ensure the directory exists (this is crucial, uncomment this line!)
  dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)
  
  message(paste("Generating plot for:", assembler_name, "on", dataset_name, "in", output_dir))
  
  # Call the plotting function for the single dool log
  generate_dool_ggplot(
    logs = list(config), # Pass the current config as a list containing one item
    save_directory = output_dir, # <-- CHANGE THIS LINE: Use 'save_directory' instead of 'output_dir'
    fig_rows = 1,
    fig_cols = 1,
    fig_legend_position = "bottom"
  )
}

message("All individual dool plots generated!")

message("All individual dool plots generated!")