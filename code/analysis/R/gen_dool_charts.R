
source("code/analysis/R/analyze_dool.R")

# Define the root directory for your dool logs
root_for_logs <- "~/Research/metagenome_results/"


# --- Short Read Assemblers ---

{
  # MEGAHIT
  dool_megahit_sr_ms <- c(paste0(root_for_logs, "megahit/sr-ms/log_dool_megahit_sr-ms_clean.csv"), "MEGAHIT", "sr-ms")
  dool_megahit_sr_even <- c(paste0(root_for_logs, "megahit/sr-even/log_dool_megahit_sr-even_clean.csv"), "MEGAHIT", "sr-even")
  dool_megahit_sr_log <- c(paste0(root_for_logs, "megahit/sr-log/log_dool_megahit_sr-log_clean.csv"), "MEGAHIT", "sr-log")
  dool_megahit_cami_high <- c(paste0(root_for_logs, "megahit/cami-high/log_dool_megahit_cami-high_clean.csv"), "MEGAHIT", "cami-high")
  dool_megahit_cami_medium <- c(paste0(root_for_logs, "megahit/cami-medium/log_dool_megahit_cami-medium_clean.csv"), "MEGAHIT", "cami-medium")
  dool_megahit_cami_low <- c(paste0(root_for_logs, "megahit/cami-low/log_dool_megahit_cami-low_clean.csv"), "MEGAHIT", "cami-low")
  
  # MetaSPAdes
  dool_metaspades_sr_ms <- c(paste0(root_for_logs, "metaspades/sr-ms/log_dool_metaspades_sr-ms_clean.csv"), "MetaSPAdes", "sr-ms")
  dool_metaspades_sr_even <- c(paste0(root_for_logs, "metaspades/sr-even/log_dool_metaspades_sr-even_clean.csv"), "MetaSPAdes", "sr-even")
  dool_metaspades_sr_log <- c(paste0(root_for_logs, "metaspades/sr-log/log_dool_metaspades_sr-log_clean.csv"), "MetaSPAdes", "sr-log")
  dool_metaspades_sr_cami_medium <- c(paste0(root_for_logs, "metaspades/cami-medium/log_dool_metaspades_cami-medium_clean.csv"), "MetaSPAdes", "sr-cami_medium")
  
  # Unicycler
  dool_unicycler_sr_even <- c(paste0(root_for_logs, "unicycler/sr-even/log_dool_unicycler_sr-even_clean.csv"), "Unicycler", "sr-even")
  dool_unicycler_sr_log <- c(paste0(root_for_logs, "unicycler/sr-log/log_dool_unicycler_sr-log_clean.csv"), "Unicycler", "sr-log")
  # Note: Unicycler for sr-ms is not in your original list, so it's omitted here.
  
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



# Long Read (lr)
logs_lr_even_key <- list(
  dool_raven_lr_even,
  dool_flye_lr_even,
  dool_canu_lr_even
)

logs_lr_log_key <- list(
  dool_raven_lr_log,
  dool_flye_lr_log,
  dool_canu_lr_log
)

# Short Read (sr)
logs_sr_even_key <- list(
  dool_megahit_sr_even,
  dool_metaspades_sr_even,
  dool_unicycler_sr_even
)

logs_sr_log_key <- list(
  dool_megahit_sr_log,
  dool_metaspades_sr_log,
  dool_unicycler_sr_log
)

logs_sr_ms_key <- list(
  dool_megahit_sr_ms,
  dool_metaspades_sr_ms
)


logs_megahit_cami_key <- list(
  dool_megahit_cami_low,
  dool_megahit_cami_medium,
  dool_megahit_cami_high
  
)



logs_sr_even_key <- list(
  dool_megahit_sr_even,
  dool_metaspades_sr_even,
  dool_unicycler_sr_even
  
)
generate_dool_ggplot(logs_sr_even_key, "exploratory/dool_figures/sr-even/",
                     fig_rows = 3, fig_cols = 1, fig_legend_position = "bottom")




1
logs_sr_log_key <- list(
  dool_megahit_sr_log,
  dool_metaspades_sr_log,
  dool_unicycler_sr_log
  
)
generate_dool_ggplot(logs_sr_log_key, "exploratory/dool_figures/sr-log/",
                     fig_rows = 3, fig_cols = 1, fig_legend_position = "bottom")











logs_lr_even_vs_log_key <- list(
  
  dool_raven_lr_even,
  dool_flye_lr_even,
  dool_canu_lr_even,
  dool_raven_lr_log,
  dool_flye_lr_log,
  dool_canu_lr_log
  
)

logs_lr_even_key <- list(
  
  dool_raven_lr_even,
  dool_flye_lr_even,
  dool_canu_lr_even
  
)

logs_lr_log_key <- list(
  
  dool_raven_lr_log,
  dool_flye_lr_log,
  dool_canu_lr_log
  
)



logs_lr_ms_key <- list (
  dool_raven_lr_ms,
  dool_flye_lr_ms,
  dool_miniasm_lr_ms,
  dool_canu_lr_ms
)

logs_sr_ms_key <- list (
  dool_megahit_lr_ms,
  dool_metaspades_sr_ms
)


logs_canu_key <- list (
  dool_canu_lr_even,
  dool_canu_lr_log
)



generate_dool_ggplot(logs_megahit_cami_key, "exploratory/dool_figures/megahit_cami/",
                     fig_rows = 3, fig_cols = 1, fig_legend_position = "bottom")


generate_dool_ggplot(logs_lr_even_vs_log_key, "exploratory/dool_figures/logs_lr_even_vs_log/",
                     fig_rows = 2, fig_cols = 3, fig_legend_position = "bottom")



generate_dool_ggplot(logs_lr_ms_key, "exploratory/dool_figures/logs_lr-ms/",
                     fig_rows = 2, fig_cols = 2, fig_legend_position = "bottom")


generate_dool_ggplot(logs_lr_ms_key, "exploratory/dool_figures/lr-ms/",
                     fig_rows = 2, fig_cols = 2, fig_legend_position = "bottom")

generate_dool_ggplot(logs_sr_ms_key, "exploratory/dool_figures/sr-ms/",
                     fig_rows = 2, fig_cols = 1, fig_legend_position = "bottom")



generate_dool_ggplot(logs_canu_key, "exploratory/dool_figures/canu/",
                     fig_rows = 1, fig_cols = 2, fig_legend_position = "bottom")




generate_dool_ggplot(logs_lr_even_key, "exploratory/dool_figures/lr-even/",
                     fig_rows = 3, fig_cols = 1, fig_legend_position = "bottom")

generate_dool_ggplot(logs_lr_log_key, "exploratory/dool_figures/lr-log/",
                     fig_rows = 3, fig_cols = 1, fig_legend_position = "bottom")


# generate_dool_ggplot(logs_lr_ms_key, "exploratory/dool_figures/lr-ms/")
# generate_dool_ggplot(logs_raven_key, "exploratory/dool_figures/raven/")

# generate_dool_ggplot(logs_lr_even_key, "exploratory/dool_figures/lr-even/")
# generate_dool_ggplot(logs_lr_log_key, "exploratory/dool_figures/lr-log/")

# generate_dool_ggplot(logs_sr_even_key, "exploratory/dool_figures/sr-even/")
# generate_dool_ggplot(logs_sr_log_key, "exploratory/dool_figures/sr-log/")
# generate_dool_ggplot(logs_sr_ms_key, "exploratory/dool_figures/sr-ms/")

# generate_dool_ggplot(logs_sr_cami_high_key, "exploratory/dool_figures/sr-cami_high/")
# generate_dool_ggplot(logs_sr_cami_medium_key, "exploratory/dool_figures/sr-cami_medium/")
# generate_dool_ggplot(logs_sr_cami_low_key, "exploratory/dool_figures/sr-cami_low/")






