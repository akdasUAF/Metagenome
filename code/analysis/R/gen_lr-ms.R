library(ggplot2)
library(dplyr)
library(tidyr)
library(tidyverse)
library(broom)
library(gridExtra)
library(gtable) # Needed for extracting legends more robustly

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
  num_rows <- nrow(dool_in)
  start_row <- min(11, num_rows)
  end_row <- max(1, num_rows - 10)
  
  if (num_rows < 21) {
    warning("Dataset is too short (less than 21 rows) for 10-second trimming. Returning full dataset.")
    return(dool_in)
  }
  
  dool_out <- dool_in %>%
    slice(start_row:end_row)
  
  if (nrow(dool_out) > 0) {
    dool_out$time <- 0:(nrow(dool_out) - 1)
  }
  
  return(dool_out)
}


make_dool_plot_cpu <- function(dool_log_file, assembler="", dataset="") {
  
  dool_raw <- read.csv(dool_log_file)
  dool_raw <- dool_raw %>% rownames_to_column(var = "time") %>% mutate(time = as.integer(as.character(time)))
  dool_raw <- trim_dool(dool_raw)
  
  dool_raw_filtered <- dool_raw %>% select(time, usr, idl)
  dool_raw_long <- dool_raw_filtered %>% pivot_longer(cols = -time, names_to = "variable", values_to = "value")
  
  plot_title = assembler
  
  dool_plot_cpu <- ggplot(dool_raw_long, aes(x = time, y = value, color = variable)) +
    labs(title = plot_title, x = "Time (s)", y = "Percentage") +
    geom_line(linewidth = 0.75) +
    scale_x_continuous(breaks = scales::pretty_breaks(n = 10)) +
    scale_y_continuous(limits = c(0, 100), breaks = seq(0, 100, length.out = 5), labels = as.integer) +
    theme_classic() +
    theme(
      legend.position = "none", # Removed legend
      plot.title = element_text(face = "bold", hjust = 0.5)
    ) +
    scale_color_manual(values = c("usr" = "chocolate3","idl" = "darkseagreen3"),
                       labels = c("Idle CPU", "User CPU"))
  return (dool_plot_cpu)
}

make_dool_plot_memory <- function(dool_log_file, assembler="", dataset="") {
  
  dool_raw <- read.csv(dool_log_file)
  dool_raw <- dool_raw %>% rownames_to_column(var = "time") %>% mutate(time = as.integer(as.character(time)))
  dool_raw <- trim_dool(dool_raw)
  
  dool_raw_filtered <- dool_raw %>%
    select(time, used, free, cach, avai) %>%
    mutate(used = as.numeric(bits_to_mb(used)),
           free = as.numeric(bits_to_mb(free)),
           cach = as.numeric(bits_to_mb(cach)),
           avai = as.numeric(bits_to_mb(avai)))
  
  dool_raw_long <- dool_raw_filtered %>% pivot_longer(cols = -time, names_to = "variable", values_to = "value")
  
  plot_title = assembler
  
  dool_plot_memory <- ggplot(dool_raw_long, aes(x = time, y = value, color = variable)) +
    labs(title = plot_title, x = "Time (s)", y = "Memory (MB)") +
    geom_line(linewidth = 0.75) +
    scale_x_continuous(breaks = scales::pretty_breaks(n = 10)) +
    theme_classic() +
    theme(
      legend.position = "none", # Removed legend
      plot.title = element_text(face = "bold", hjust = 0.5)
    ) +
    scale_color_manual(values = c("used" = "#48448EFF", "free" = "#8CCC58FF", "cach" = "#FC4D97FF","avai" = "#B82578FF"),
                       labels = c("Available Memory", "Cached Memory", "Free Memory", "Used Memory"))
  
  return (dool_plot_memory)
}

make_dool_plot_virtmemory <- function(dool_log_file, assembler="", dataset="") {
  
  dool_raw <- read.csv(dool_log_file)
  dool_raw <- dool_raw %>% rownames_to_column(var = "time") %>% mutate(time = as.integer(as.character(time)))
  dool_raw <- trim_dool(dool_raw)
  
  dool_raw_filtered <- dool_raw %>%
    select(time, majpf, minpf, alloc, free.1) %>%
    mutate(majpf = as.numeric(bits_to_kb(majpf)),
           minpf = as.numeric(bits_to_kb(minpf)),
           alloc = as.numeric(bits_to_kb(alloc)),
           vfree = as.numeric(bits_to_kb(free.1))) %>%
    select(-free.1)
  
  dool_raw_long <- dool_raw_filtered %>% pivot_longer(cols = -time, names_to = "variable", values_to = "value")
  
  plot_title = assembler
  
  dool_plot_virtmemory <- ggplot(dool_raw_long, aes(x = time, y = value, color = variable)) +
    labs(title = plot_title, x = "Time (s)", y = "Memory (KB)") +
    geom_line(linewidth = 0.75) +
    scale_x_continuous(breaks = scales::pretty_breaks(n = 10)) +
    theme_classic() +
    theme(
      legend.position = "none", # Removed legend
      plot.title = element_text(face = "bold", hjust = 0.5)
    ) +
    scale_color_manual(values = c("majpf" = "#48448EFF", "minpf" = "#8CCC58FF", "alloc" = "#FC4D97FF"),
                       labels = c("Major Page Faults", "Minor Page Faults", "Virtual Allocated"))
  
  return (dool_plot_virtmemory)
}


make_dool_plot_cpu_mem_percentage <- function(dool_log_file, assembler="", dataset="") {
  
  dool_raw <- read.csv(dool_log_file)
  dool_raw <- dool_raw %>% rownames_to_column(var = "time") %>% mutate(time = as.integer(as.character(time)))
  dool_raw <- trim_dool(dool_raw)
  
  dool_processed <- dool_raw %>%
    mutate(CPU_percent_used = 100 - idl) %>%
    mutate(
      calculated_total_memory_bits = used + free + cach,
      used_mb = as.numeric(bits_to_mb(used)),
      calculated_total_memory_mb = as.numeric(bits_to_mb(calculated_total_memory_bits)),
      Memory_percent_used = (used_mb / calculated_total_memory_mb) * 100
    ) %>%
    select(time, usr, idl, CPU_percent_used, Memory_percent_used, used_mb)
  
  dool_long <- dool_processed %>%
    pivot_longer(cols = c(CPU_percent_used, Memory_percent_used), names_to = "Metric", values_to = "Percentage")
  
  plot_title = assembler
  
  dool_plot_combined <- ggplot(dool_long, aes(x = time, y = Percentage, color = Metric)) +
    labs(title = plot_title, x = "Time (s)", y = "Percentage (%)") +
    geom_line(linewidth = 0.75) +
    scale_x_continuous(breaks = scales::pretty_breaks(n = 10)) +
    scale_y_continuous(limits = c(0, 100), breaks = seq(0, 100, 20), labels = as.integer) +
    theme_classic() +
    theme(
      legend.position = "none", # Removed individual legend for subplots
      plot.title = element_text(face = "bold", hjust = 0.5)
    ) +
    scale_color_manual(values = c("CPU_percent_used" = "DarkOrchid", "Memory_percent_used" = "DarkOrange"),
                       labels = c("CPU Usage", "Memory Usage"))
  
  # --- Calculate Statistics (without annotating on plot) ---
  median_cpu <- round(median(dool_processed$CPU_percent_used, na.rm = TRUE), 2)
  max_cpu <- round(max(dool_processed$CPU_percent_used, na.rm = TRUE), 2)
  median_ram_mb <- round(median(dool_processed$used_mb, na.rm = TRUE), 2)
  max_ram_mb <- round(max(dool_processed$used_mb, na.rm = TRUE), 2)
  
  # Return the plot and the statistics
  return(list(
    plot = dool_plot_combined,
    stats = list(
      Assembler = assembler,
      Dataset = dataset,
      Median_CPU_Pct = median_cpu,
      Max_CPU_Pct = max_cpu,
      Median_RAM_MB = median_ram_mb,
      Max_RAM_MB = max_ram_mb
    )
  ))
}


### Function to generate dool plots
generate_dool_ggplot <- function(logs_to_plot, save_directory) {
  
  plot_list_memory <- list()
  plot_list_cpu <- list()
  plot_list_virt <- list()
  plot_list_combined <- list()
  all_combined_stats <- list() # To store statistics for console output
  
  i <- 1
  for (logg in logs_to_plot) {
    plot_list_memory[[i]] <- make_dool_plot_memory(logg[[1]], logg[[2]], logg[[3]])
    plot_list_cpu[[i]] <- make_dool_plot_cpu(logg[[1]], logg[[2]], logg[[3]])
    plot_list_virt[[i]] <- make_dool_plot_virtmemory(logg[[1]], logg[[2]], logg[[3]])
    
    # Call the modified function and store both plot and stats
    combined_result <- make_dool_plot_cpu_mem_percentage(logg[[1]], logg[[2]], logg[[3]])
    plot_list_combined[[i]] <- combined_result$plot
    all_combined_stats[[i]] <- combined_result$stats # Store stats for printing later
    
    i <- i + 1
  }
  
  # Arrange plots in grids
  full_memory <- grid.arrange(grobs = plot_list_memory, ncol = ceiling(length(plot_list_memory) / 2))
  full_cpu <- grid.arrange(grobs = plot_list_cpu, ncol = ceiling(length(plot_list_cpu) / 2))
  full_virt <- grid.arrange(grobs = plot_list_virt, ncol = ceiling(length(plot_list_virt) / 2))
  
  
  # --- Create a single, shared legend for the combined plots ---
  # Use the first plot's assembler and dataset for the dummy plot
  dummy_combined_plot_for_legend <- make_dool_plot_cpu_mem_percentage(
    dool_log_file = logs_to_plot[[1]][[1]],
    assembler = logs_to_plot[[1]][[2]],
    dataset = logs_to_plot[[1]][[3]]
  )$plot + theme(legend.position = "bottom", legend.key.size = unit(1.5, "cm")) # Get just the plot component
  
  extract_legend <- function(a_ggplot){
    tmp <- ggplot_gtable(ggplot_build(a_ggplot))
    leg <- which(sapply(tmp$grobs, function(x) x$name) == "guide-box")
    if (length(leg) > 0) {
      legend <- tmp$grobs[[leg]]
      return(legend)
    }
    return(NULL)
  }
  
  shared_legend_grob <- extract_legend(dummy_combined_plot_for_legend)
  
  # --- NO dataset name grob needed ---
  # Removed code for dataset_display_text and dataset_name_grob
  
  # --- Adjust for combined plot layout (NO overall title, just legend) ---
  num_plots <- length(plot_list_combined)
  num_plot_rows <- ceiling(num_plots / 2)
  fixed_ncol <- 2 # Explicitly set to 2 columns
  
  # Prepare grobs for grid.arrange (no overall_title_grob)
  all_grobs_for_combined <- plot_list_combined
  if (!is.null(shared_legend_grob)) {
    all_grobs_for_combined <- c(all_grobs_for_combined, list(shared_legend_grob))
  }
  
  # Create the layout matrix
  # Plot indices start from 1 (since no title row)
  plot_indices_start <- 1
  plot_indices_end <- plot_indices_start + num_plots - 1
  legend_idx <- plot_indices_end + 1 # This will point to the shared_legend_grob
  
  plot_layout_indices <- c(plot_indices_start:plot_indices_end, rep(NA, fixed_ncol * num_plot_rows - num_plots))
  plot_layout_matrix <- matrix(plot_layout_indices, nrow = num_plot_rows, ncol = fixed_ncol, byrow = TRUE)
  
  layout_matrix_final <- plot_layout_matrix # Only plots initially
  if (!is.null(shared_legend_grob)) {
    layout_matrix_final <- rbind(layout_matrix_final, rep(legend_idx, fixed_ncol)) # Legend row spans all columns
  }
  
  # Define relative heights for rows
  # (Each plot row, Legend row)
  legend_height_ratio <- 0.05 # Smaller space for legend
  plots_height_ratio <- 1 - legend_height_ratio
  plot_height_per_row = plots_height_ratio / num_plot_rows
  
  heights_final <- rep(plot_height_per_row, num_plot_rows)
  if (!is.null(shared_legend_grob)) {
    heights_final <- c(heights_final, legend_height_ratio)
  }
  
  full_combined <- grid.arrange(
    grobs = all_grobs_for_combined,
    layout_matrix = layout_matrix_final,
    heights = heights_final
  )
  
  # Saving plots
  ggsave(paste(save_directory, "dool_memory.png", sep = ""), full_memory, width = 12, height = 8)
  ggsave(paste(save_directory, "dool_cpu.png", sep = ""), full_cpu, width = 12, height = 8)
  ggsave(paste(save_directory, "dool_virt.png", sep = ""), full_virt, width = 12, height = 8)
  ggsave(paste(save_directory, "dool_cpu_mem_percentage.png", sep = ""), full_combined, width = 12, height = 8)
  
  # --- Print collected statistics to console ---
  cat("\n--- CPU & RAM Usage Statistics ---\n")
  stats_df <- bind_rows(all_combined_stats)
  print(stats_df)
  cat("----------------------------------\n")
  
  return (list(full_memory = full_memory, full_cpu = full_cpu, full_virt = full_virt, full_combined = full_combined))
}