# Define the root directory for your dool logs
root_for_logs <- "~/Research/Metagenome_results/"

{
    
  # --- Short Read Assemblers ---
  # MEGAHIT
  dool_megahit_sr_ms <- c(paste0(root_for_logs, "megahit/sr-ms/log_dool_megahit_sr-ms_clean.csv"), "MEGAHIT", "sr-ms")
  dool_megahit_sr_even <- c(paste0(root_for_logs, "megahit/sr-even/log_dool_megahit_sr-even_clean.csv"), "MEGAHIT", "sr-even")
  dool_megahit_sr_log <- c(paste0(root_for_logs, "megahit/sr-log/log_dool_megahit_sr-log_clean.csv"), "MEGAHIT", "sr-log")
  
  # MetaSPAdes
  dool_metaspades_sr_ms <- c(paste0(root_for_logs, "metaspades/sr-ms/log_dool_metaspades_sr-ms_clean.csv"), "MetaSPAdes", "sr-ms")
  dool_metaspades_sr_even <- c(paste0(root_for_logs, "metaspades/sr-even/log_dool_metaspades_sr-even_clean.csv"), "MetaSPAdes", "sr-even")
  dool_metaspades_sr_log <- c(paste0(root_for_logs, "metaspades/sr-log/log_dool_metaspades_sr-log_clean.csv"), "MetaSPAdes", "sr-log")
  
  # ABySS
  dool_abyss_sr_ms <- c(paste0(root_for_logs, "abyss/sr-ms/log_dool_abyss_sr-ms_clean.csv"), "ABySS", "sr-ms")
  dool_abyss_sr_even <- c(paste0(root_for_logs, "abyss/sr-even/log_dool_abyss_sr-even_clean.csv"), "ABySS", "sr-even")
  dool_abyss_sr_log <- c(paste0(root_for_logs, "abyss/sr-log/log_dool_abyss_sr-log_clean.csv"), "ABySS", "sr-log")
  
  # Unicycler
  dool_unicycler_sr_ms <- c(paste0(root_for_logs, "unicycler/sr-ms/log_dool_unicycler_sr-ms_clean.csv"), "Unicycler", "sr-ms")
  dool_unicycler_sr_even <- c(paste0(root_for_logs, "unicycler/sr-even/log_dool_unicycler_sr-even_clean.csv"), "Unicycler", "sr-even")
  dool_unicycler_sr_log <- c(paste0(root_for_logs, "unicycler/sr-log/log_dool_unicycler_sr-log_clean.csv"), "Unicycler", "sr-log")
  
  
  # --- Long Read Assemblers ---
  # Canu
  dool_canu_lr_ms <- c(paste0(root_for_logs, "canu/lr-ms/log_dool_canu_lr-ms_clean.csv"), "Canu", "lr-ms")
  dool_canu_lr_even <- c(paste0(root_for_logs, "canu/lr-even/log_dool_canu_lr-even_clean.csv"), "Canu", "lr-even")
  dool_canu_lr_log <- c(paste0(root_for_logs, "canu/lr-log/log_dool_canu_lr-log_clean.csv"), "Canu", "lr-log")
  
  # Flye
  dool_flye_lr_ms <- c(paste0(root_for_logs, "flye/lr-ms/log_dool_flye_lr-ms_clean.csv"), "Flye", "lr-ms")
  dool_flye_lr_even <- c(paste0(root_for_logs, "flye/lr-even/log_dool_flye_lr-even_clean.csv"), "Flye", "lr-even")
  dool_flye_lr_log <- c(paste0(root_for_logs, "flye/lr-log/log_dool_flye_lr-log_clean.csv"), "Flye", "lr-log")
  
  # MiniASM
  dool_miniasm_lr_ms <- c(paste0(root_for_logs, "miniasm/lr-ms/log_dool_miniasm_lr-ms_clean.csv"), "MiniASM", "lr-ms")
  dool_miniasm_lr_even <- c(paste0(root_for_logs, "miniasm/lr-even/log_dool_miniasm_lr-even_clean.csv"), "MiniASM", "lr-even")
  dool_miniasm_lr_log <- c(paste0(root_for_logs, "miniasm/lr-log/log_dool_miniasm_lr-log_clean.csv"), "MiniASM", "lr-log")
  
  # Raven
  dool_raven_lr_ms <- c(paste0(root_for_logs, "raven/lr-ms/log_dool_raven_lr-ms_clean.csv"), "Raven", "lr-ms")
  dool_raven_lr_even <- c(paste0(root_for_logs, "raven/lr-even/log_dool_raven_lr-even_clean.csv"), "Raven", "lr-even")
  dool_raven_lr_log <- c(paste0(root_for_logs, "raven/lr-log/log_dool_raven_lr-log_clean.csv"), "Raven", "lr-log")

}




logs_lr_ms_key <- list(
  dool_canu_lr_ms,
  dool_flye_lr_ms,
  dool_miniasm_lr_ms,
  dool_raven_lr_ms
)


logs_raven_key <- list(
  dool_raven_lr_ms,
  dool_raven_lr_even,
  dool_raven_lr_log
)


generate_dool_ggplot(logs_lr_ms_key, "exploratory/dool_figures/lr-ms/")
generate_dool_ggplot(logs_raven_key, "exploratory/dool_figures/raven/")







