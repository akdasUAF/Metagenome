#### 
library(ggplot2)
library(dplyr)
library(tidyr)
library(tidyverse)
library(broom)


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
  
  dool_out <- dool_in %>%
    slice(11:nrow(dool_in) - 10)
  return(dool_out)
}


make_dool_plot_cpu <- function(dool_log_file, assembler="", dataset="") {
  
  dool_raw <- read.csv(dool_log_file)

  dool_raw <- dool_raw %>%
    rownames_to_column(var = "time")
  
  dool_raw <- dool_raw %>%
    mutate(time = as.integer(as.character(time)))
  
  dool_raw_filtered <- dool_raw %>%
    select(time, usr, idl)  # Adjust columns as needed

  # Reshape the data to long format
  dool_raw_long <- dool_raw_filtered %>%
    pivot_longer(cols = -time, names_to = "variable", values_to = "value")
  
  plot_title = paste(assembler, " assembly (", dataset, "): CPU Performance over time", sep="")
  
  dool_plot_cpu <- ggplot(dool_raw_long, aes(x = time, y = value, color = variable)) +
    labs(title = plot_title, x = "Time (s)", y = "Percentage", color = "CPU Processes") +
    geom_line(linewidth = 0.75) +
    scale_x_continuous(breaks = seq(min(dool_raw_long$time), max(dool_raw_long$time), length.out = 15), labels = as.integer) +
    scale_y_continuous(limits = c(0, 100), breaks = seq(0, 100, length.out = 10), labels = as.integer) + 
    theme_classic() + 
    scale_color_manual(values = c("usr" = "chocolate3","idl" = "darkseagreen3"),
                       labels = c("Idle CPU", "User CPU"))
  
  return (dool_plot_cpu)
}

make_dool_plot_memory <- function(dool_log_file, assembler="", dataset="") {
  
  # dool_raw <- read.csv(dool_log_file)
  dool_raw <- read.csv(dool_log_file)
  
  dool_raw <- dool_raw %>%
    rownames_to_column(var = "time") 
  
  
  dool_raw_filtered <- dool_raw %>%
    select(time, used, free, cach, avai) %>%
    mutate(time = as.integer(as.character(time))) %>%
    mutate(used = as.numeric(bits_to_mb(used))) %>% 
    mutate(free = as.numeric(bits_to_mb(free))) %>% 
    mutate(cach = as.numeric(bits_to_mb(cach))) %>% 
    mutate(avai = as.numeric(bits_to_mb(avai)))
  
  # Reshape the data to long format
  dool_raw_long <- dool_raw_filtered %>%
    pivot_longer(cols = -time, names_to = "variable", values_to = "value")
  
  
  plot_title = paste(assembler, " assembly (", dataset, "): Memory Performance over time", sep="")

  dool_plot_memory <- ggplot(dool_raw_long, aes(x = time, y = value, color = variable)) +
    labs(title = plot_title, x = "Time (s)", y = "Memory (MB)", color = "Memory Allocated") +
    geom_line(linewidth = 0.75) +
    #geom_point(size = 0.05) + 
    scale_x_continuous(breaks = seq(min(dool_raw_long$time), max(dool_raw_long$time), length.out = 10), labels = as.integer) +
    scale_y_continuous(limits = c(0, 15000), breaks = seq(0, 15000, length.out = 10), labels = as.integer) + 
    theme_classic() + 
    scale_color_manual(values = c("used" = "#48448EFF", "free" = "#8CCC58FF", "cach" = "#FC4D97FF","avai" = "#B82578FF"),
                       labels = c("Available Memory", "Cached Memory", "Free Memory", "Used Memory"))
  
  return (dool_plot_memory)
}

make_dool_plot_virtmemory <- function(dool_log_file, assembler="", dataset="") {
  
  # dool_raw <- read.csv(dool_log_file)
  dool_raw <- read.csv(dool_log_file)
  
  dool_raw <- trim_dool(dool_raw) %>%
    rownames_to_column(var = "time") 
  
  
  dool_raw_filtered <- dool_raw %>%
    select(time, majpf, minpf, alloc, free.1) %>%
    mutate(time = as.numeric(time)) %>%
    mutate(majpf = as.numeric(bits_to_kb(majpf))) %>% 
    mutate(minpf = as.numeric(bits_to_kb(minpf))) %>% 
    mutate(alloc = as.numeric(bits_to_kb(alloc))) %>% 
    mutate(vfree = as.numeric(bits_to_kb(free.1))) %>%
    select(-free.1, -vfree)
  
  
  # Reshape the data to long format
  dool_raw_long <- dool_raw_filtered %>%
    pivot_longer(cols = -time, names_to = "variable", values_to = "value")
  
    
  plot_title = paste(assembler, " assembly (", dataset, "): Virtual Memory Performance over time", sep="")
  
  dool_plot_virtmemory <- ggplot(dool_raw_long, aes(x = time, y = value, color = variable)) +
    labs(title = plot_title, x = "Time (s)", y = "Memory (MB)", color = "Memory Allocated") +
    geom_line(size = 0.75) +
    #geom_point(size = 0.05) + 
    scale_x_continuous(breaks = seq(min(dool_raw_long$time), max(dool_raw_long$time), length.out = 10), labels = as.integer) +
    # scale_y_continuous(limits = c(0, 15000), breaks = seq(0, 15000, length.out = 10), labels = as.integer) + 
    theme_classic() + 
    scale_color_manual(values = c("majpf" = "#48448EFF", "minpf" = "#8CCC58FF", "alloc" = "#FC4D97FF"),
                       labels = c("Virtual Majpf", "Virtual Minpf", "Virtual Allocated"))
  
  return (dool_plot_virtmemory)
}
















dool_megahit_bmock_memory <- make_dool_plot_memory("data/dool_logs/dool_sr-bmock_megahit_no-head.csv", "MEGAHIT", "sr-bmock")
dool_megahit_bmock_memory

ggsave("exploratory/figures/dool_plots/doolplot_megahit_sr-bmock.png", dool_megahit_bmock_memory, width = 10, height = 5, units = "in", dpi = 300)


dool_metaspades_bmock_memory <- make_dool_plot_memory("data/dool_logs/dool_sr-bmock_metaspades_no-head.csv", "MetaSPAdes", "sr-bmock")
dool_metaspades_bmock_memory

ggsave("exploratory/figures/dool_plots/doolplot_metaspades_sr-bmock.png", dool_metaspades_bmock_memory, width = 10, height = 5, units = "in", dpi = 300)

dool_unicycler_bmock_memory <- make_dool_plot_memory("data/dool_logs/dool_sr-bmock_unicycler_no-head.csv", "Unicycler", "sr-bmock")
dool_unicycler_bmock_memory

ggsave("exploratory/figures/dool_plots/doolplot_unicycler_sr-bmock.png", dool_unicycler_bmock_memory, width = 10, height = 5, units = "in", dpi = 300)










dool_megahit_bmock_cpu <- make_dool_plot_cpu("data/dool_logs/dool_sr-bmock_megahit_no-head.csv", "MEGAHIT", "sr-bmock")
dool_megahit_bmock_cpu

ggsave("exploratory/figures/dool_plots/doolplot_megahit_sr-bmock.png", dool_megahit_bmock_memory, width = 10, height = 5, units = "in", dpi = 300)


dool_metaspades_bmock_memory <- make_dool_plot_memory("data/dool_logs/dool_sr-bmock_metaspades_no-head.csv", "MetaSPAdes", "sr-bmock")
dool_metaspades_bmock_memory

ggsave("exploratory/figures/dool_plots/doolplot_metaspades_sr-bmock.png", dool_metaspades_bmock_memory, width = 10, height = 5, units = "in", dpi = 300)

dool_unicycler_bmock_memory <- make_dool_plot_memory("data/dool_logs/dool_sr-bmock_unicycler_no-head.csv", "Unicycler", "sr-bmock")
dool_unicycler_bmock_memory

ggsave("exploratory/figures/dool_plots/doolplot_unicycler_sr-bmock.png", dool_unicycler_bmock_memory, width = 10, height = 5, units = "in", dpi = 300)











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




###### lr-bd Long read Buttler Drown
dool_bd_raven_memory <- make_dool_plot_memory("data/dool_logs/dool_asm_lr-bd_raven_no-header.csv", "Raven", "lr-bd")
dool_bd_raven_memory

dool_bd_raven_cpu <- make_dool_plot_cpu("data/dool_logs/dool_asm_lr-bd_raven_no-header.csv", "Raven", "lr-bd")
dool_bd_raven_cpu

ggsave("exploratory/figures/dool_plots/doolplot_lr-bd_raven_memory.png", dool_bd_raven_memory, width = 10, height = 5, units = "in", dpi = 300)
ggsave("exploratory/figures/dool_plots/doolplot_lr-bd_raven_cpu.png", dool_bd_raven_cpu, width = 10, height = 5, units = "in", dpi = 300)

