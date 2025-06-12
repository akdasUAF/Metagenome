library(ggplot2)
library(dplyr)
library(tidyr)
library(tidyverse)
library(broom)
library(gridExtra)

bits_to_mb <- function(bits) {
  # Conversion factor: 1 MB = 8 * 2^20 bits
  mb <- bits / (8 * 2^20)
  return(mb)
}

bits_to_kb <- function(bits) {
  # Conversion factor: 1 KB = 8 * 2^10 bits
  kb <- bits / (8 * 2^10)
  return(kb)
}

trim_dool <- function(dool_in) {
  # Calculate the number of rows to trim from the end
  # Ensure we don't try to trim more rows than exist in the data
  num_rows <- nrow(dool_in)
  start_row <- min(11, num_rows) # Start at 11th row or the last if data is too short
  end_row <- max(1, num_rows - 10) # End 10 rows from the end, or at the first if data is too short
  
  # If data is too short to trim, return the original data or handle as an error
  if (num_rows < 21) { # 10 from start + 10 from end + 1 in middle
    warning("Dataset is too short (less than 21 rows) for 10-second trimming. Returning full dataset.")
    return(dool_in)
  }
  
  dool_out <- dool_in %>%
    slice(start_row:end_row)
  
  # Reset time/row names after slicing if they were sequential
  # If 'time' column is already numeric and represents seconds, no need to reset rownames
  # Assuming 'time' column is already correct after initial read.csv + rownames_to_column
  # If it still represents row numbers, you might need to re-index it from 1 to new_nrow
  # For now, assuming slice maintains relative time or you adjust time column later
  return(dool_out)
}


make_dool_plot_cpu <- function(dool_log_file, assembler="", dataset="") {
  
  dool_raw <- read.csv(dool_log_file)
  
  dool_raw <- dool_raw %>%
    rownames_to_column(var = "time")
  
  dool_raw <- dool_raw %>%
    mutate(time = as.integer(as.character(time)))
  
  # Apply trimming
  dool_raw <- trim_dool(dool_raw)
  
  # Adjust time column to start from 0 after trimming
  if (nrow(dool_raw) > 0) {
    dool_raw$time <- dool_raw$time - min(dool_raw$time)
  }
  
  dool_raw_filtered <- dool_raw %>%
    select(time, usr, idl) # Adjust columns as needed
  
  # Reshape the data to long format
  dool_raw_long <- dool_raw_filtered %>%
    pivot_longer(cols = -time, names_to = "variable", values_to = "value")
  
  plot_title = paste(assembler, " (", dataset, "): CPU", sep="")
  
  dool_plot_cpu <- ggplot(dool_raw_long, aes(x = time, y = value, color = variable)) +
    labs(title = plot_title, x = "Time (s)", y = "Percentage", color = "CPU Processes") +
    geom_line(linewidth = 0.75) +
    scale_x_continuous(breaks = scales::pretty_breaks(n = 10)) +
    scale_y_continuous(limits = c(0, 100), breaks = seq(0, 100, length.out = 5), labels = as.integer) +
    theme_classic() +
    theme(legend.position = "bottom",
          legend.key.size = unit(1.5, "cm")) +
    scale_color_manual(values = c("usr" = "chocolate3","idl" = "darkseagreen3"),
                       labels = c("Idle CPU", "User CPU"))
  
  return (dool_plot_cpu)
}

make_dool_plot_memory <- function(dool_log_file, assembler="", dataset="") {
  
  dool_raw <- read.csv(dool_log_file)
  
  dool_raw <- dool_raw %>%
    rownames_to_column(var = "time")
  
  dool_raw <- dool_raw %>%
    mutate(time = as.integer(as.character(time)))
  
  # Apply trimming
  dool_raw <- trim_dool(dool_raw)
  
  # Adjust time column to start from 0 after trimming
  if (nrow(dool_raw) > 0) {
    dool_raw$time <- dool_raw$time - min(dool_raw$time)
  }
  
  dool_raw_filtered <- dool_raw %>%
    select(time, used, free, cach, avai) %>%
    mutate(used = as.numeric(bits_to_mb(used))) %>%
    mutate(free = as.numeric(bits_to_mb(free))) %>%
    mutate(cach = as.numeric(bits_to_mb(cach))) %>%
    mutate(avai = as.numeric(bits_to_mb(avai)))
  
  # Reshape the data to long format
  dool_raw_long <- dool_raw_filtered %>%
    pivot_longer(cols = -time, names_to = "variable", values_to = "value")
  
  
  plot_title = paste(assembler, " (", dataset, "): Memory", sep="")
  
  dool_plot_memory <- ggplot(dool_raw_long, aes(x = time, y = value, color = variable)) +
    labs(title = plot_title,
         x = "Time (s)",
         y = "Memory (MB)",
         color = "Memory Allocated") +
    geom_line(linewidth = 0.75) +
    scale_x_continuous(breaks = scales::pretty_breaks(n = 10)) +
    theme_classic() +
    theme(legend.position = "bottom",
          legend.key.size = unit(1.5, "cm")) +
    scale_color_manual(values = c("used" = "#48448EFF", "free" = "#8CCC58FF", "cach" = "#FC4D97FF","avai" = "#B82578FF"),
                       labels = c("Available Memory", "Cached Memory", "Free Memory", "Used Memory"))
  
  return (dool_plot_memory)
}

make_dool_plot_virtmemory <- function(dool_log_file, assembler="", dataset="") {
  
  dool_raw <- read.csv(dool_log_file)
  
  dool_raw <- dool_raw %>%
    rownames_to_column(var = "time")
  
  dool_raw <- dool_raw %>%
    mutate(time = as.integer(as.character(time)))
  
  # Apply trimming
  dool_raw <- trim_dool(dool_raw)
  
  # Adjust time column to start from 0 after trimming
  if (nrow(dool_raw) > 0) {
    dool_raw$time <- dool_raw$time - min(dool_raw$time)
  }
  
  dool_raw_filtered <- dool_raw %>%
    select(time, majpf, minpf, alloc, free.1) %>%
    mutate(majpf = as.numeric(bits_to_kb(majpf))) %>%
    mutate(minpf = as.numeric(bits_to_kb(minpf))) %>%
    mutate(alloc = as.numeric(bits_to_kb(alloc))) %>%
    mutate(vfree = as.numeric(bits_to_kb(free.1))) %>%
    select(-free.1, -vfree) # Keep alloc, majpf, minpf, remove old free.1 and new vfree if not needed
  
  # Reshape the data to long format
  dool_raw_long <- dool_raw_filtered %>%
    pivot_longer(cols = -time, names_to = "variable", values_to = "value")
  
  
  plot_title = paste(assembler, " assembly (", dataset, "): Virtual Memory", sep="")
  
  dool_plot_virtmemory <- ggplot(dool_raw_long, aes(x = time, y = value, color = variable)) +
    labs(title = plot_title, x = "Time (s)", y = "Memory (KB)", color = "Memory Allocated") + # Changed to KB from MB for virtmem
    geom_line(linewidth = 0.75) +
    scale_x_continuous(breaks = scales::pretty_breaks(n = 10)) +
    theme_classic() +
    theme(legend.position = "bottom",
          legend.key.size = unit(1.5, "cm")) +
    scale_color_manual(values = c("majpf" = "#48448EFF", "minpf" = "#8CCC58FF", "alloc" = "#FC4D97FF"),
                       labels = c("Major Page Faults", "Minor Page Faults", "Virtual Allocated"))
  
  return (dool_plot_virtmemory)
}

















make_dool_plot_cpu_mem_percentage <- function(dool_log_file, assembler="", dataset="") { # Removed total_system_ram_mb argument
  
  dool_raw <- read.csv(dool_log_file)
  
  dool_raw <- dool_raw %>%
    rownames_to_column(var = "time")
  
  dool_raw <- dool_raw %>%
    mutate(time = as.integer(as.character(time)))
  
  # Apply trimming
  dool_raw <- trim_dool(dool_raw)
  
  # Adjust time column to start from 0 after trimming
  if (nrow(dool_raw) > 0) {
    dool_raw$time <- dool_raw$time - min(dool_raw$time)
  }
  
  # --- MODIFICATION START ---
  # Calculate 'total' memory from 'used', 'free', and 'cach'
  # Assuming used, free, and cach are in bits as per your bits_to_mb function usage
  dool_processed <- dool_raw %>%
    mutate(CPU_percent_used = 100 - idl) %>% # Total CPU usage is 100% minus idle
    mutate(
      # Calculate total memory at each timestamp (in bits)
      calculated_total_memory_bits = used + free + cach,
      # Convert used memory to MB
      used_mb = as.numeric(bits_to_mb(used)),
      # Convert calculated total memory to MB
      calculated_total_memory_mb = as.numeric(bits_to_mb(calculated_total_memory_bits)),
      # Calculate Memory_percent_used based on calculated total
      Memory_percent_used = (used_mb / calculated_total_memory_mb) * 100
    ) %>%
    select(time, CPU_percent_used, Memory_percent_used)
  # --- MODIFICATION END ---
  
  
  # Reshape for ggplot
  dool_long <- dool_processed %>%
    pivot_longer(cols = -time, names_to = "Metric", values_to = "Percentage")
  
  plot_title = paste(assembler, " (", dataset, "): CPU & Memory %", sep="")
  
  dool_plot_combined <- ggplot(dool_long, aes(x = time, y = Percentage, color = Metric)) +
    labs(title = plot_title,
         x = "Time (s)",
         y = "Percentage (%)",
         color = "Resource") +
    geom_line(linewidth = 0.75) +
    scale_x_continuous(breaks = scales::pretty_breaks(n = 10)) +
    scale_y_continuous(limits = c(0, 100), breaks = seq(0, 100, 20), labels = as.integer) +
    theme_classic() +
    theme(legend.position = "bottom",
          legend.key.size = unit(1.5, "cm")) +
    scale_color_manual(values = c("CPU_percent_used" = "darkred", "Memory_percent_used" = "darkblue"),
                       labels = c("CPU Usage", "Memory Usage"))
  
  return(dool_plot_combined)
}









### Function to generate a four by four graph
generate_dool_ggplot <- function(logs_to_plot, save_directory) { # Removed total_system_ram_mb here
  
  plot_list_memory <- list()
  plot_list_cpu <- list()
  plot_list_virt <- list()
  plot_list_combined <- list()
  
  i <- 1
  
  for (logg in logs_to_plot) {
    plot_list_memory[[i]] <- make_dool_plot_memory(logg[[1]], logg[[2]], logg[[3]])
    plot_list_cpu[[i]] <- make_dool_plot_cpu(logg[[1]], logg[[2]], logg[[3]])
    plot_list_virt[[i]] <- make_dool_plot_virtmemory(logg[[1]], logg[[2]], logg[[3]])
    # Call the new function WITHOUT total_system_ram_mb
    plot_list_combined[[i]] <- make_dool_plot_cpu_mem_percentage(logg[[1]], logg[[2]], logg[[3]])
    i <- i + 1
  }
  
  full_memory <- grid.arrange(grobs = plot_list_memory, ncol = ceiling(length(plot_list_memory) / 2))
  full_cpu <- grid.arrange(grobs = plot_list_cpu, ncol = ceiling(length(plot_list_cpu) / 2))
  full_virt <- grid.arrange(grobs = plot_list_virt, ncol = ceiling(length(plot_list_virt) / 2))
  full_combined <- grid.arrange(grobs = plot_list_combined, ncol = ceiling(length(plot_list_combined) / 2))
  
  ggsave(paste(save_directory, "dool_memory.png", sep = ""), full_memory, width = 12, height = 8)
  ggsave(paste(save_directory, "dool_cpu.png", sep = ""), full_cpu, width = 12, height = 8)
  ggsave(paste(save_directory, "dool_virt.png", sep = ""), full_virt, width = 12, height = 8)
  ggsave(paste(save_directory, "dool_cpu_mem_percentage.png", sep = ""), full_combined, width = 12, height = 8)
  
  return (list(full_memory = full_memory, full_cpu = full_cpu, full_virt = full_virt, full_combined = full_combined))
}












### Load all dool_charts
dool_megahit_bmock <- c("data/dool_logs/log_dool_megahit_sr-bmock_clean.csv", "MEGAHIT", "sr-bmock")
dool_megahit_log <- c("data/dool_logs/log_dool_megahit_sr-log_clean.csv", "MEGAHIT", "sr-log")
dool_megahit_crust <- c("data/dool_logs/log_dool_megahit_sr-crust_clean.csv", "MEGAHIT", "sr-Soil Crust")
dool_megahit_ms <- c("data/dool_logs/log_dool_megahit_sr-ms_clean.csv", "MEGAHIT", "sr-Marine Sediment")

logs_to_plot <- list(
  dool_megahit_bmock,
  dool_megahit_log,
  dool_megahit_crust,
  dool_megahit_ms
)

generate_dool_ggplot(logs_to_plot, "data/dool_logs/")








### Load all dool_charts
dool_log_metaspades <- c("data/dool_logs/sr-log/log_dool_metaspades_sr-log_no-header.csv", "MetaSPAdes", "sr-log")
dool_log_megahit<- c("data/dool_logs/sr-log/log_dool_megahit_sr-log_no-header.csv", "MEGAHIT", "sr-log")


logs_to_plot <- list(
  dool_log_metaspades,
  dool_log_megahit
)

generate_dool_ggplot(logs_to_plot, "exploratory/sr-log/")



### Load all dool_charts
dool_raven_lr_log <- c("data/dool_logs/sr-log/log_dool_metaspades_sr-log_no-header.csv", "MetaSPAdes", "sr-log")
dool_raven_lr_log<- c("data/dool_logs/sr-log/log_dool_megahit_sr-log_no-header.csv", "MEGAHIT", "sr-log")


logs_to_plot <- list(
  dool_log_metaspades,
  dool_log_megahit
)

generate_dool_ggplot(logs_to_plot, "exploratory/sr-log/")




### Load all dool_charts
dool_even_metaspades <- c("data/dool_logs/sr-even/log_dool_metaspades_sr-even_no-header.csv", "MetaSPAdes", "sr-even")
dool_even_megahit<- c("data/dool_logs/sr-even/log_dool_megahit_sr-even_no-headers.csv", "MEGAHIT", "sr-even")


logs_to_plot <- list(
  dool_even_metaspades,
  dool_even_megahit
)

generate_dool_ggplot(logs_to_plot, "exploratory/sr-even/")




### Load all dool_charts
dool_raven_even <- c("data/dool_logs/raven/log_dool_raven_lr-even.csv", "Raven", "lr-even")
dool_raven_log <- c("data/dool_logs/raven/log_dool_raven_lr-log.csv", "Raven", "lr-log")
dool_raven_ms <- c("data/dool_logs/raven/log_dool_raven_lr-ms.csv", "Raven", "lr-ms")


logs_to_plot <- list(
  dool_raven_even,
  dool_raven_log,
  dool_raven_ms
)

generate_dool_ggplot(logs_to_plot, "exploratory/raven/")









dool_megahit_bmock_memory <- make_dool_plot_memory("data/dool_logs/dool_sr-bmock_megahit_no-head.csv", "MEGAHIT", "sr-bmock")
dool_megahit_bmock_memory

ggsave("exploratory/figures/dool_plots/doolplot_megahit_sr-bmock.png", dool_megahit_bmock_memory, width = 10, height = 5, units = "in", dpi = 300)


dool_metaspades_bmock_memory <- make_dool_plot_memory("data/dool_logs/dool_sr-bmock_metaspades_no-head.csv", "MetaSPAdes", "sr-bmock")
dool_metaspades_bmock_memory

ggsave("exploratory/figures/dool_plots/doolplot_metaspades_sr-bmock.png", dool_metaspades_bmock_memory, width = 10, height = 5, units = "in", dpi = 300)

dool_unicycler_bmock_memory <- make_dool_plot_memory("data/dool_logs/dool_sr-bmock_unicycler_no-head.csv", "Unicycler", "sr-bmock")
dool_unicycler_bmock_memory

ggsave("exploratory/figures/dool_plots/doolplot_unicycler_sr-bmock.png", dool_unicycler_bmock_memory, width = 10, height = 5, units = "in", dpi = 300)








generate_dool_ggplot()














dool_megahit_bmock_cpu <- make_dool_plot_cpu("data/dool_logs/dool_sr-bmock_megahit_no-head.csv", "MEGAHIT", "sr-bmock")
dool_megahit_bmock_cpu

ggsave("exploratory/figures/dool_plots/doolplot_megahit_sr-bmock.png", dool_megahit_bmock_memory, width = 10, height = 5, units = "in", dpi = 300)


dool_metaspades_bmock_memory <- make_dool_plot_memory("data/dool_logs/dool_sr-bmock_metaspades_no-head.csv", "MetaSPAdes", "sr-bmock")
dool_metaspades_bmock_memory

ggsave("exploratory/figures/dool_plots/doolplot_metaspades_sr-bmock.png", dool_metaspades_bmock_memory, width = 10, height = 5, units = "in", dpi = 300)

dool_unicycler_bmock_memory <- make_dool_plot_memory("data/dool_logs/dool_sr-bmock_unicycler_no-head.csv", "Unicycler", "sr-bmock")
dool_unicycler_bmock_memory

ggsave("exploratory/figures/dool_plots/doolplot_unicycler_sr-bmock.png", dool_unicycler_bmock_memory, width = 10, height = 5, units = "in", dpi = 300)






temp <- read.csv("data/dool_logs/sr-log/log_dool_metaspades_sr-log_no-header.csv")




dool_plot_virtmemory <- make_dool_plot_virtmemory("data/dool_logs/log_dool_megahit_sr-bmock_no-header.csv", "Megahit", "sr-bmock")
dool_plot_virtmemory

dool_plot_memory <- make_dool_plot_memory("data/dool_logs/log_dool_metaspades_sr-log_no-header.csv", "MetaSPAdes", "sr-log")
dool_plot_memory

dool_plot_cpu <- make_dool_plot_cpu("data/dool_logs/log_dool_metaspades_sr-log_no-header.csv", "MetaSPAdes", "sr-log")
dool_plot_cpu

"vfree" = "#B82578FF"

dool_flye_lr_ms_memory <- make_dool_plot_memory("data/dool_logs/dool_asm_flye_lr-marine_sediment_no-header.csv", "Flye", "lr-ms")
dool_flye_lr_ms_memory

dool_flye_lr_ms_cpu <- make_dool_plot_cpu("data/dool_logs/dool_asm_flye_lr-marine_sediment_no-header.csv", "Flye", "lr-ms")
dool_flye_lr_ms_cpu

dool_canu_lr_ms_memory <- make_dool_plot_memory("data/dool_logs/dool_asm_canu_lr-marine_sediment_no-header.csv", "Canu", "lr-ms")
dool_canu_lr_ms_memory

dool_canu_lr_ms_cpu <- make_dool_plot_cpu("data/dool_logs/dool_asm_canu_lr-marine_sediment_no-header.csv", "Canu", "lr-ms")
dool_canu_lr_ms_cpu

dool_miniasm_lr_ms_memory <- make_dool_plot_memory("data/dool_logs/dool_asm_miniasm_lr-marine_sediment_no-header.csv", "MiniASM", "lr-ms")
dool_miniasm_lr_ms_memory

dool_miniasm_lr_ms_cpu <- make_dool_plot_cpu("data/dool_logs/dool_asm_miniasm_lr-marine_sediment_no-header.csv", "MiniASM", "lr-ms")
dool_miniasm_lr_ms_cpu

dool_raven_lr_ms_memory <- make_dool_plot_memory("data/dool_logs/dool_asm_raven_lr-marine_sediment_no-header.csv", "Raven", "lr-ms")
dool_raven_lr_ms_memory

dool_raven_lr_ms_cpu <- make_dool_plot_cpu("data/dool_logs/dool_asm_raven_lr-marine_sediment_no-header.csv", "Raven", "lr-ms")
dool_raven_lr_ms_cpu

dool_raw <- read.csv("data/dool_logs/log_dool_megahit_sr-bmock_no-header.csv")

ggsave("exploratory/figures/dool_plots/dool_plot_asm_megahit_sr-bmock.png", dool_plot, width = 10, height = 5, units = "in", dpi = 300)


###### sr-bmock Short Read Mock Even community
# Megahit
dool_megahit_bmock_cpu <- make_dool_plot_cpu("data/dool_logs/dool_sr-bmock_megahit_no-head.csv", "MEGAHIT", "sr-bmock")
dool_megahit_bmock_cpu
dool_megahit_bmock_memory <- make_dool_plot_memory("data/dool_logs/dool_sr-bmock_megahit_no-head.csv", "MEGAHIT", "sr-bmock")
dool_megahit_bmock_memory
ggsave("exploratory/figures/dool_plots/doolplot_sr-bmock_megahit_memory.png", dool_megahit_bmock_memory, width = 10, height = 5, units = "in", dpi = 300)
ggsave("exploratory/figures/dool_plots/doolplot_sr-bmock_megahit_cpu.png", dool_megahit_bmock_memory, width = 10, height = 5, units = "in", dpi = 300)


dool_metaspades_bmock_cpu <- make_dool_plot_cpu("data/dool_logs/dool_sr-bmock_metaspades_no-head.csv", "MetaSPAdes", "sr-bmock")
dool_metaspades_bmock_cpu
dool_metaspades_bmock_memory <- make_dool_plot_memory("data/dool_logs/dool_sr-bmock_metaspades_no-head.csv", "MetaSPAdes", "sr-bmock")
dool_metaspades_bmock_memory
ggsave("exploratory/figures/dool_plots/doolplot_sr-bmock_metaspades_memory.png", dool_metaspades_bmock_memory, width = 10, height = 5, units = "in", dpi = 300)
ggsave("exploratory/figures/dool_plots/doolplot_sr-bmock_metaspades_cpu.png", dool_metaspades_bmock_memory, width = 10, height = 5, units = "in", dpi = 300)


dool_unicycler_bmock_cpu <- make_dool_plot_cpu("data/dool_logs/dool_sr-bmock_unicycler_no-head.csv", "Unicycler", "sr-bmock")
dool_unicycler_bmock_cpu
dool_unicycler_bmock_memory <- make_dool_plot_memory("data/dool_logs/dool_sr-bmock_unicycler_no-head.csv", "Unicycler", "sr-bmock")
dool_unicycler_bmock_memory
ggsave("exploratory/figures/dool_plots/doolplot_sr-bmock_unicycler_memory.png", dool_unicycler_bmock_memory, width = 10, height = 5, units = "in", dpi = 300)
ggsave("exploratory/figures/dool_plots/doolplot_sr-bmock_unicycler_cpu.png", dool_unicycler_bmock_memory, width = 10, height = 5, units = "in", dpi = 300)

sbmock_cpu <- grid.arrange(dool_megahit_bmock_cpu, dool_metaspades_bmock_cpu, dool_unicycler_bmock_cpu, ncol = 2)
sbmock_memory <- grid.arrange(dool_megahit_bmock_memory, dool_metaspades_bmock_memory, dool_unicycler_bmock_memory, ncol = 2)

ggsave("exploratory/figures/dool_plots/sr-bmock_cpu_combined.png", sbmock_cpu)
ggsave("exploratory/figures/dool_plots/sr-bmock_memory_combined.png", sbmock_memory)



###### lr-bd Long read Buttler Drown
dool_bd_raven_memory <- make_dool_plot_memory("data/dool_logs/lr-even/dool_asm_lr-bd_raven_no-header.csv", "Raven", "lr-bd")
dool_bd_raven_cpu <- make_dool_plot_cpu("data/dool_logs/dool_asm_lr-bd_raven_no-header.csv", "Raven", "lr-bd")


dool_bd_miniasm_memory <- make_dool_plot_memory("data/dool_logs/dool_lr-bd_miniasm_midway_no-header.csv", "MiniASM", "lr-bd")
dool_bd_miniasm_cpu <- make_dool_plot_cpu("data/dool_logs/dool_lr-bd_miniasm_midway_no-header.csv", "MiniASM", "lr-bd")

bd_memory <- grid.arrange(dool_bd_raven_memory, dool_bd_miniasm_memory, ncol = 2)
bd_cpu <- grid.arrange(dool_bd_raven_cpu, dool_bd_miniasm_cpu, ncol = 2)
ggsave("exploratory/figures/dool_plots/lr-bd_memory_combined.png", bd_memory)
ggsave("exploratory/figures/dool_plots/lr-bd_cpu_combined.png", bd_cpu)

