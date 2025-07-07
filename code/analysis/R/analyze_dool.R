{
  library(ggplot2)
  library(dplyr)
  library(tidyr)
  library(tidyverse)
  library(broom)
  library(gridExtra)
  library(cowplot)
}

bits_to_mb <- function(bits) {
  mb <- bits / (8 * 2^20)
  return(mb)
}

bits_to_kb <- function(bits) {
  kb <- bits / (8 * 2^10)
  return(kb)
}

trim_dool <- function(dool_in) {
  num_rows <- nrow(dool_in)
  start_row <- min(11, num_rows)
  end_row <- max(1, num_rows - 10)
  
  if (num_rows < 21) {
    warning("Dataset is too short (less than 21 rows) for 10-second trimming. Returning full dataset.")
    return(dool_in)
  }
  
  dool_out <- dool_in %>%
    slice(start_row:end_row)
  
  return(dool_out)
}


make_dool_plot_cpu <- function(dool_log_file, assembler="", dataset="") {
  dool_raw <- read.csv(dool_log_file) %>%
    rownames_to_column(var = "time") %>%
    mutate(time = as.integer(as.character(time)))
  
  dool_raw <- trim_dool(dool_raw)
  
  if (nrow(dool_raw) > 0) {
    dool_raw$time <- dool_raw$time - min(dool_raw$time)
  }
  
  dool_raw_filtered <- dool_raw %>%
    select(time, usr, idl)
  
  dool_raw_long <- dool_raw_filtered %>%
    pivot_longer(cols = -time, names_to = "variable", values_to = "value")
  
  plot_title = paste(assembler, " (", dataset, "): CPU", sep="")
  
  dool_plot_cpu <- ggplot(dool_raw_long, aes(x = time, y = value, color = variable)) +
    labs(title = plot_title, x = "Time (s)", y = "Percentage", color = "CPU Processes") +
    geom_line(linewidth = 0.75) +
    scale_x_continuous(breaks = scales::pretty_breaks(n = 10)) +
    scale_y_continuous(limits = c(0, 100), breaks = seq(0, 100, length.out = 5), labels = as.integer) +
    theme_classic() +
    theme(legend.key.size = unit(1.5, "cm"),
          legend.direction = "horizontal",  # Force horizontal layout for extraction
          legend.box = "horizontal") +     # Force horizontal box for extraction
    scale_color_manual(values = c("usr" = "chocolate3","idl" = "darkseagreen3"),
                       labels = c("User CPU", "Idle CPU")) # Changed order for logical labels if needed
  
  return (dool_plot_cpu)
}

make_dool_plot_memory <- function(dool_log_file, assembler="", dataset="") {
  dool_raw <- read.csv(dool_log_file) %>%
    rownames_to_column(var = "time") %>%
    mutate(time = as.integer(as.character(time)))
  
  dool_raw <- trim_dool(dool_raw)
  
  if (nrow(dool_raw) > 0) {
    dool_raw$time <- dool_raw$time - min(dool_raw$time)
  }
  
  dool_raw_filtered <- dool_raw %>%
    select(time, used, free, cach, avai) %>%
    mutate(used = as.numeric(bits_to_mb(used)),
           free = as.numeric(bits_to_mb(free)),
           cach = as.numeric(bits_to_mb(cach)),
           avai = as.numeric(bits_to_mb(avai)))
  
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
    theme(legend.key.size = unit(1.5, "cm"),
          legend.direction = "horizontal", # Force horizontal layout for extraction
          legend.box = "horizontal") +    # Force horizontal box for extraction
    scale_color_manual(values = c("used" = "#48448EFF", "free" = "#8CCC58FF", "cach" = "#FC4D97FF","avai" = "#B82578FF"),
                       labels = c("Used Memory", "Free Memory", "Cached Memory", "Available Memory")) # Adjusted labels order to match common expectation
  
  return (dool_plot_memory)
}

make_dool_plot_virtmemory <- function(dool_log_file, assembler="", dataset="") {
  
  dool_raw <- read.csv(dool_log_file) %>%
    rownames_to_column(var = "time") %>%
    mutate(time = as.integer(as.character(time)))
  
  dool_raw <- trim_dool(dool_raw)
  
  if (nrow(dool_raw) > 0) {
    dool_raw$time <- dool_raw$time - min(dool_raw$time)
  }
  
  dool_raw_filtered <- dool_raw %>%
    select(time, majpf, minpf, alloc, free.1) %>%
    mutate(majpf = as.numeric(bits_to_kb(majpf)),
           minpf = as.numeric(bits_to_kb(minpf)),
           alloc = as.numeric(bits_to_kb(alloc)),
           vfree = as.numeric(bits_to_kb(free.1))) %>%
    select(-free.1) # Removed -vfree here as it's not defined after the select
  
  dool_raw_long <- dool_raw_filtered %>%
    pivot_longer(cols = -time, names_to = "variable", values_to = "value")
  
  
  plot_title = paste(assembler, " assembly (", dataset, "): Virtual Memory", sep="")
  
  dool_plot_virtmemory <- ggplot(dool_raw_long, aes(x = time, y = value, color = variable)) +
    labs(title = plot_title, x = "Time (s)", y = "Memory (KB)", color = "Memory Allocated") +
    geom_line(linewidth = 0.75) +
    scale_x_continuous(breaks = scales::pretty_breaks(n = 10)) +
    theme_classic() +
    theme(legend.key.size = unit(1.5, "cm"),
          legend.direction = "horizontal", # Force horizontal layout for extraction
          legend.box = "horizontal") +    # Force horizontal box for extraction
    scale_color_manual(values = c("majpf" = "#48448EFF", "minpf" = "#8CCC58FF", "alloc" = "#FC4D97FF", "vfree" = "orange"),
                       labels = c("Major Page Faults", "Minor Page Faults", "Virtual Allocated", "Virtual Free"))
  
  return (dool_plot_virtmemory)
}

make_dool_plot_cpu_mem_percentage <- function(dool_log_file, assembler="", dataset="") {
  dool_raw <- read.csv(dool_log_file) %>%
    rownames_to_column(var = "time") %>%
    mutate(time = as.integer(as.character(time)))
  
  dool_raw <- trim_dool(dool_raw)
  
  if (nrow(dool_raw) > 0) {
    dool_raw$time <- dool_raw$time - min(dool_raw$time)
  }
  
  dool_processed <- dool_raw %>%
    mutate(CPU_percent_used = 100 - idl) %>%
    mutate(
      calculated_total_memory_bits = used + free + cach + avai, # Include 'avai' for a more accurate 'total' if it represents truly available system memory
      used_mb = as.numeric(bits_to_mb(used)),
      # Ensure calculated_total_memory_mb is not zero to prevent NaN/Inf
      calculated_total_memory_mb = as.numeric(bits_to_mb(calculated_total_memory_bits)),
      Memory_percent_used = ifelse(calculated_total_memory_mb > 0,
                                   (used_mb / calculated_total_memory_mb) * 100,
                                   0) # Handle division by zero
    ) %>%
    select(time, CPU_percent_used, Memory_percent_used) # Ensure both columns are selected
  
  dool_long <- dool_processed %>%
    pivot_longer(cols = c(CPU_percent_used, Memory_percent_used), # Explicitly specify columns to pivot
                 names_to = "Metric", values_to = "Percentage")
  
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
    theme(legend.key.size = unit(1.5, "cm"),
          legend.direction = "horizontal", # Force horizontal layout for extraction
          legend.box = "horizontal") +    # Force horizontal box for extraction
    scale_color_manual(values = c("CPU_percent_used" = "darkred", "Memory_percent_used" = "darkblue"),
                       labels = c("CPU Usage", "Memory Usage"))
  
  return(dool_plot_combined)
}


generate_dool_ggplot <- function(logs_to_plot, save_directory, fig_rows = NULL, fig_cols = NULL, fig_legend_position = "bottom") {
  
  plot_list_memory <- list()
  plot_list_cpu <- list()
  plot_list_virt <- list()
  plot_list_combined <- list()
  
  # Iterate through each log entry and generate plots,
  # temporarily keeping the legend in the first plot of each type
  for (i in seq_along(logs_to_plot)) {
    logg <- logs_to_plot[[i]]
    plot_list_memory[[i]] <- make_dool_plot_memory(logg[[1]], logg[[2]], logg[[3]])
    plot_list_cpu[[i]] <- make_dool_plot_cpu(logg[[1]], logg[[2]], logg[[3]])
    plot_list_virt[[i]] <- make_dool_plot_virtmemory(logg[[1]], logg[[2]], logg[[3]])
    plot_list_combined[[i]] <- make_dool_plot_cpu_mem_percentage(logg[[1]], logg[[2]], logg[[3]])
  }
  
  # Determine layout based on provided rows/columns or calculate automatically
  num_plots <- length(logs_to_plot)
  if (is.null(fig_rows) && is.null(fig_cols)) {
    fig_cols <- ceiling(sqrt(num_plots))
    fig_rows <- ceiling(num_plots / fig_cols)
  } else if (is.null(fig_rows)) {
    fig_rows <- ceiling(num_plots / fig_cols)
  } else if (is.null(fig_cols)) {
    fig_rows <- ceiling(num_plots / fig_rows) # This was a typo, should be fig_cols <- ceiling(num_plots / fig_rows)
  } else {
    if (fig_rows * fig_cols < num_plots) {
      warning("Specified fig_rows * fig_cols is less than the number of plots. Some plots might not be displayed in the grid.")
    }
  }
  
  
  # Extract legends (requires cowplot::get_legend)
  # Ensure there's at least one plot before extracting legend
  common_legend_memory <- if(length(plot_list_memory) > 0) get_legend(plot_list_memory[[1]]) else NULL
  common_legend_cpu <- if(length(plot_list_cpu) > 0) get_legend(plot_list_cpu[[1]]) else NULL
  common_legend_virt <- if(length(plot_list_virt) > 0) get_legend(plot_list_virt[[1]]) else NULL
  common_legend_combined <- if(length(plot_list_combined) > 0) get_legend(plot_list_combined[[1]]) else NULL
  
  # Set legend.position = "none" for all individual plots
  # lapply applies a function to each element of a list
  plot_list_memory <- lapply(plot_list_memory, function(p) p + theme(legend.position = "none"))
  plot_list_cpu <- lapply(plot_list_cpu, function(p) p + theme(legend.position = "none"))
  plot_list_virt <- lapply(plot_list_virt, function(p) p + theme(legend.position = "none"))
  plot_list_combined <- lapply(plot_list_combined, function(p) p + theme(legend.position = "none"))
  
  # Function to arrange plots and add common legend
  # This helper handles the variable names for grobs and common_legend
  arrange_and_add_legend <- function(plots_list, legend_grob, rows, cols, position) {
    if (is.null(legend_grob)) { # If no plots, no legend to add
      return(NULL)
    }
    arranged_plots <- arrangeGrob(grobs = plots_list, nrow = rows, ncol = cols)
    
    # Adjust height ratios for legend. If the legend has many items, 0.1 might be too small.
    # Experiment with this value (e.g., 0.15, 0.2) if clipping continues.
    legend_height_ratio <- 0.15 # Increased slightly from 0.1
    
    if (position == "bottom") {
      full_plot <- grid.arrange(arranged_plots, legend_grob, ncol = 1, heights = c(1, legend_height_ratio))
    } else if (position == "top") {
      full_plot <- grid.arrange(legend_grob, arranged_plots, ncol = 1, heights = c(legend_height_ratio, 1))
    } else {
      warning(paste("Invalid fig_legend_position: '", position, "'. Legend will not be added outside the grid.", sep=""))
      full_plot <- arranged_plots # Return plots without external legend
    }
    return(full_plot)
  }
  
  full_memory <- arrange_and_add_legend(plot_list_memory, common_legend_memory, fig_rows, fig_cols, fig_legend_position)
  full_cpu <- arrange_and_add_legend(plot_list_cpu, common_legend_cpu, fig_rows, fig_cols, fig_legend_position)
  full_virt <- arrange_and_add_legend(plot_list_virt, common_legend_virt, fig_rows, fig_cols, fig_legend_position)
  full_combined <- arrange_and_add_legend(plot_list_combined, common_legend_combined, fig_rows, fig_cols, fig_legend_position)
  
  # Save the plots (only if they were successfully generated)
  if (!is.null(full_memory)) ggsave(paste0(save_directory, "dool_memory.png"), full_memory, width = 12, height = 8)
  if (!is.null(full_cpu)) ggsave(paste0(save_directory, "dool_cpu.png"), full_cpu, width = 12, height = 8)
  if (!is.null(full_virt)) ggsave(paste0(save_directory, "dool_virt.png"), full_virt, width = 12, height = 8)
  if (!is.null(full_combined)) ggsave(paste0(save_directory, "dool_cpu_mem_percentage.png"), full_combined, width = 12, height = 8)
  
  return (list(full_memory = full_memory, full_cpu = full_cpu, full_virt = full_virt, full_combined = full_combined))
}