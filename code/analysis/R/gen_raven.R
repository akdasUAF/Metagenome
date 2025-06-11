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
    # It's better to return an empty data frame if it's too short to trim meaningfully
    # This prevents slice from potentially returning undesirable results on tiny data
    if (num_rows == 0) return(data.frame())
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


# Helper function to create a placeholder plot
create_placeholder_plot <- function(message) {
  ggplot() + 
    annotate("text", x = 0.5, y = 0.5, label = message, size = 5, color = "red") + 
    theme_void() +
    theme(plot.background = element_rect(fill = "gray95", colour = NA))
}

make_dool_plot_cpu <- function(dool_log_file, assembler="", dataset="") {
  dool_raw <- tryCatch(read.csv(dool_log_file), error = function(e) {
    warning(paste("Could not read file", dool_log_file, ":", e$message))
    return(data.frame()) # Return empty dataframe on error
  })
  
  if (nrow(dool_raw) == 0) {
    warning(paste("Dool log file", dool_log_file, "is empty after reading. Skipping plot for", assembler, dataset))
    return(create_placeholder_plot(paste("No Data:\n", assembler)))
  }
  
  dool_raw <- dool_raw %>% rownames_to_column(var = "time") %>% mutate(time = as.integer(as.character(time)))
  dool_raw <- trim_dool(dool_raw)
  
  if (nrow(dool_raw) == 0) {
    warning(paste("Dool log file", dool_log_file, "is empty after trimming. Skipping plot for", assembler, dataset))
    return(create_placeholder_plot(paste("No Data after trim:\n", assembler)))
  }
  
  required_cols <- c("time", "usr", "idl")
  if (!all(required_cols %in% names(dool_raw))) {
    missing_cols <- setdiff(required_cols, names(dool_raw))
    warning(paste("Missing columns", paste(missing_cols, collapse=", "), "in", dool_log_file, ". Skipping plot for", assembler, dataset))
    return(create_placeholder_plot(paste("Missing Cols (CPU):\n", paste(missing_cols, collapse=","), "\n", assembler)))
  }
  
  dool_raw_filtered <- dool_raw %>% select(all_of(required_cols)) 
  dool_raw_long <- dool_raw_filtered %>% pivot_longer(cols = -time, names_to = "variable", values_to = "value")
  
  dool_plot_cpu <- ggplot(dool_raw_long, aes(x = time, y = value, color = variable)) +
    labs(title = "", x = "Time (s)", y = "Percentage") + 
    geom_line(linewidth = 0.75) +
    scale_x_continuous(breaks = scales::pretty_breaks(n = 10)) +
    scale_y_continuous(limits = c(0, 100), breaks = seq(0, 100, length.out = 5), labels = as.integer) +
    theme_classic() +
    theme(
      legend.position = "none",
      plot.title = element_blank() 
    ) +
    scale_color_manual(values = c("usr" = "chocolate3","idl" = "darkseagreen3"),
                       labels = c("Idle CPU", "User CPU"))
  return (dool_plot_cpu)
}

make_dool_plot_memory <- function(dool_log_file, assembler="", dataset="") {
  dool_raw <- tryCatch(read.csv(dool_log_file), error = function(e) {
    warning(paste("Could not read file", dool_log_file, ":", e$message))
    return(data.frame()) # Return empty dataframe on error
  })
  
  if (nrow(dool_raw) == 0) {
    warning(paste("Dool log file", dool_log_file, "is empty after reading. Skipping plot for", assembler, dataset))
    return(create_placeholder_plot(paste("No Data:\n", assembler)))
  }
  
  dool_raw <- dool_raw %>% rownames_to_column(var = "time") %>% mutate(time = as.integer(as.character(time)))
  dool_raw <- trim_dool(dool_raw)
  
  if (nrow(dool_raw) == 0) {
    warning(paste("Dool log file", dool_log_file, "is empty after trimming. Skipping plot for", assembler, dataset))
    return(create_placeholder_plot(paste("No Data after trim:\n", assembler)))
  }
  
  required_cols <- c("time", "used", "free", "cach", "avai")
  if (!all(required_cols %in% names(dool_raw))) {
    missing_cols <- setdiff(required_cols, names(dool_raw))
    warning(paste("Missing columns", paste(missing_cols, collapse=", "), "in", dool_log_file, ". Skipping plot for", assembler, dataset))
    return(create_placeholder_plot(paste("Missing Cols (Mem):\n", paste(missing_cols, collapse=","), "\n", assembler)))
  }
  
  dool_raw_filtered <- dool_raw %>%
    select(all_of(required_cols)) %>% # Use all_of for robustness
    mutate(used = as.numeric(bits_to_mb(used)),
           free = as.numeric(bits_to_mb(free)),
           cach = as.numeric(bits_to_mb(cach)),
           avai = as.numeric(bits_to_mb(avai)))
  
  dool_raw_long <- dool_raw_filtered %>% pivot_longer(cols = -time, names_to = "variable", values_to = "value")
  
  dool_plot_memory <- ggplot(dool_raw_long, aes(x = time, y = value, color = variable)) +
    labs(title = "", x = "Time (s)", y = "Memory (MB)") + 
    geom_line(linewidth = 0.75) +
    scale_x_continuous(breaks = scales::pretty_breaks(n = 10)) +
    theme_classic() +
    theme(
      legend.position = "none", 
      plot.title = element_blank() 
    ) +
    scale_color_manual(values = c("used" = "#48448EFF", "free" = "#8CCC58FF", "cach" = "#FC4D97FF","avai" = "#B82578FF"),
                       labels = c("Available Memory", "Cached Memory", "Free Memory", "Used Memory"))
  
  return (dool_plot_memory)
}

make_dool_plot_virtmemory <- function(dool_log_file, assembler="", dataset="") {
  dool_raw <- tryCatch(read.csv(dool_log_file), error = function(e) {
    warning(paste("Could not read file", dool_log_file, ":", e$message))
    return(data.frame()) # Return empty dataframe on error
  })
  
  if (nrow(dool_raw) == 0) {
    warning(paste("Dool log file", dool_log_file, "is empty after reading. Skipping plot for", assembler, dataset))
    return(create_placeholder_plot(paste("No Data:\n", assembler)))
  }
  
  dool_raw <- dool_raw %>% rownames_to_column(var = "time") %>% mutate(time = as.integer(as.character(time)))
  dool_raw <- trim_dool(dool_raw)
  
  if (nrow(dool_raw) == 0) {
    warning(paste("Dool log file", dool_log_file, "is empty after trimming. Skipping plot for", assembler, dataset))
    return(create_placeholder_plot(paste("No Data after trim:\n", assembler)))
  }
  
  required_cols <- c("time", "majpf", "minpf", "alloc", "free.1")
  if (!all(required_cols %in% names(dool_raw))) {
    missing_cols <- setdiff(required_cols, names(dool_raw))
    warning(paste("Missing columns", paste(missing_cols, collapse=", "), "in", dool_log_file, ". Skipping plot for", assembler, dataset))
    return(create_placeholder_plot(paste("Missing Cols (Virt):\n", paste(missing_cols, collapse=","), "\n", assembler)))
  }
  
  dool_raw_filtered <- dool_raw %>%
    select(all_of(required_cols)) %>% # Use all_of for robustness
    mutate(majpf = as.numeric(bits_to_kb(majpf)),
           minpf = as.numeric(bits_to_kb(minpf)),
           alloc = as.numeric(bits_to_kb(alloc)),
           vfree = as.numeric(bits_to_kb(free.1))) %>%
    select(-free.1)
  
  dool_raw_long <- dool_raw_filtered %>% pivot_longer(cols = -time, names_to = "variable", values_to = "value")
  
  dool_plot_virtmemory <- ggplot(dool_raw_long, aes(x = time, y = value, color = variable)) +
    labs(title = "", x = "Time (s)", y = "Memory (KB)") + 
    geom_line(linewidth = 0.75) +
    scale_x_continuous(breaks = scales::pretty_breaks(n = 10)) +
    theme_classic() +
    theme(
      legend.position = "none", 
      plot.title = element_blank() 
    ) +
    scale_color_manual(values = c("majpf" = "#48448EFF", "minpf" = "#8CCC58FF", "alloc" = "#FC4D97FF"),
                       labels = c("Major Page Faults", "Minor Page Faults", "Virtual Allocated"))
  
  return (dool_plot_virtmemory)
}


make_dool_plot_cpu_mem_percentage <- function(dool_log_file, assembler="", dataset="") {
  dool_raw <- tryCatch(read.csv(dool_log_file), error = function(e) {
    warning(paste("Could not read file", dool_log_file, ":", e$message))
    return(data.frame()) # Return empty dataframe on error
  })
  
  if (nrow(dool_raw) == 0) {
    warning(paste("Dool log file", dool_log_file, "is empty after reading. Skipping plot for", assembler, dataset))
    return(create_placeholder_plot(paste("No Data:\n", assembler)))
  }
  
  dool_raw <- dool_raw %>% rownames_to_column(var = "time") %>% mutate(time = as.integer(as.character(time)))
  dool_raw <- trim_dool(dool_raw)
  
  if (nrow(dool_raw) == 0) {
    warning(paste("Dool log file", dool_log_file, "is empty after trimming. Skipping plot for", assembler, dataset))
    return(create_placeholder_plot(paste("No Data after trim:\n", assembler)))
  }
  
  required_cols_calc <- c("time", "idl", "used", "free", "cach")
  if (!all(required_cols_calc %in% names(dool_raw))) {
    missing_cols <- setdiff(required_cols_calc, names(dool_raw))
    warning(paste("Missing calculation columns", paste(missing_cols, collapse=", "), "in", dool_log_file, ". Skipping plot for", assembler, dataset))
    return(create_placeholder_plot(paste("Missing Cols (CPU/Mem % Calc):\n", paste(missing_cols, collapse=","), "\n", assembler)))
  }
  
  dool_processed <- dool_raw %>%
    mutate(CPU_percent_used = 100 - idl) %>%
    mutate(
      calculated_total_memory_bits = used + free + cach,
      used_mb = as.numeric(bits_to_mb(used)),
      calculated_total_memory_mb = as.numeric(bits_to_mb(calculated_total_memory_bits)),
      Memory_percent_used = (used_mb / calculated_total_memory_mb) * 100
    ) %>%
    select(time, CPU_percent_used, Memory_percent_used, used_mb) # Select final columns
  
  if (nrow(dool_processed) == 0) {
    warning(paste("Dool data frame for", dool_log_file, "became empty after processing. Skipping plot for", assembler, dataset))
    return(create_placeholder_plot(paste("No Data after process:\n", assembler)))
  }
  
  dool_long <- dool_processed %>%
    pivot_longer(cols = c(CPU_percent_used, Memory_percent_used), names_to = "Metric", values_to = "Percentage")
  
  dool_plot_combined <- ggplot(dool_long, aes(x = time, y = Percentage, color = Metric)) +
    labs(title = "", x = "Time (s)", y = "Percentage (%)") + 
    geom_line(linewidth = 0.75) +
    scale_x_continuous(breaks = scales::pretty_breaks(n = 10)) +
    scale_y_continuous(limits = c(0, 100), breaks = seq(0, 100, 20), labels = as.integer) +
    theme_classic() +
    theme(
      legend.position = "none", 
      plot.title = element_blank() 
    ) +
    scale_color_manual(values = c("CPU_percent_used" = "DarkOrchid", "Memory_percent_used" = "DarkOrange"),
                       labels = c("CPU Usage", "Memory Usage"))
  
  # --- Calculate Statistics (without annotating on plot) ---
  median_cpu <- round(median(dool_processed$CPU_percent_used, na.rm = TRUE), 2)
  max_cpu <- round(max(dool_processed$CPU_percent_used, na.rm = TRUE), 2)
  median_ram_mb <- round(median(dool_processed$used_mb, na.rm = TRUE), 2)
  max_ram_mb <- round(max(dool_processed$used_mb, na.rm = TRUE), 2)
  
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

# --- NEW FUNCTIONS FOR INDIVIDUAL PERCENTAGE PLOTS ---
make_dool_plot_cpu_percentage <- function(dool_log_file, assembler="", dataset="") {
  dool_raw <- tryCatch(read.csv(dool_log_file), error = function(e) {
    warning(paste("Could not read file", dool_log_file, ":", e$message))
    return(data.frame()) 
  })
  
  if (nrow(dool_raw) == 0) {
    warning(paste("Dool log file", dool_log_file, "is empty after reading. Skipping plot for", assembler, dataset))
    return(create_placeholder_plot(paste("No Data:\n", assembler)))
  }
  
  dool_raw <- dool_raw %>% rownames_to_column(var = "time") %>% mutate(time = as.integer(as.character(time)))
  dool_raw <- trim_dool(dool_raw)
  
  if (nrow(dool_raw) == 0) {
    warning(paste("Dool log file", dool_log_file, "is empty after trimming. Skipping plot for", assembler, dataset))
    return(create_placeholder_plot(paste("No Data after trim:\n", assembler)))
  }
  
  required_cols <- c("time", "idl")
  if (!all(required_cols %in% names(dool_raw))) {
    missing_cols <- setdiff(required_cols, names(dool_raw))
    warning(paste("Missing columns", paste(missing_cols, collapse=", "), "in", dool_log_file, ". Skipping CPU % plot for", assembler, dataset))
    return(create_placeholder_plot(paste("Missing Cols (CPU %):\n", paste(missing_cols, collapse=","), "\n", assembler)))
  }
  
  dool_processed <- dool_raw %>% mutate(CPU_percent_used = 100 - idl)
  
  ggplot(dool_processed, aes(x = time, y = CPU_percent_used)) +
    labs(title = "", x = "Time (s)", y = "CPU %") + # Shorter Y-axis label for space
    geom_line(color = "DarkOrchid", linewidth = 0.75) + 
    scale_x_continuous(breaks = scales::pretty_breaks(n = 5)) + # Fewer breaks for subplots
    scale_y_continuous(limits = c(0, 100), breaks = seq(0, 100, 50), labels = as.integer) + # Fewer breaks
    theme_classic() +
    theme(legend.position = "none", plot.title = element_blank(),
          axis.text.x = element_text(size = 8), axis.text.y = element_text(size = 8),
          axis.title.x = element_text(size = 9), axis.title.y = element_text(size = 9))
}

make_dool_plot_memory_percentage <- function(dool_log_file, assembler="", dataset="") {
  dool_raw <- tryCatch(read.csv(dool_log_file), error = function(e) {
    warning(paste("Could not read file", dool_log_file, ":", e$message))
    return(data.frame()) 
  })
  
  if (nrow(dool_raw) == 0) {
    warning(paste("Dool log file", dool_log_file, "is empty after reading. Skipping plot for", assembler, dataset))
    return(create_placeholder_plot(paste("No Data:\n", assembler)))
  }
  
  dool_raw <- dool_raw %>% rownames_to_column(var = "time") %>% mutate(time = as.integer(as.character(time)))
  dool_raw <- trim_dool(dool_raw)
  
  if (nrow(dool_raw) == 0) {
    warning(paste("Dool log file", dool_log_file, "is empty after trimming. Skipping plot for", assembler, dataset))
    return(create_placeholder_plot(paste("No Data after trim:\n", assembler)))
  }
  
  required_cols <- c("time", "used", "free", "cach")
  if (!all(required_cols %in% names(dool_raw))) {
    missing_cols <- setdiff(required_cols, names(dool_raw))
    warning(paste("Missing columns", paste(missing_cols, collapse=", "), "in", dool_log_file, ". Skipping Memory % plot for", assembler, dataset))
    return(create_placeholder_plot(paste("Missing Cols (Mem %):\n", paste(missing_cols, collapse=","), "\n", assembler)))
  }
  
  dool_processed <- dool_raw %>%
    mutate(
      calculated_total_memory_bits = used + free + cach,
      used_mb = as.numeric(bits_to_mb(used)),
      calculated_total_memory_mb = as.numeric(bits_to_mb(calculated_total_memory_bits)),
      Memory_percent_used = (used_mb / calculated_total_memory_mb) * 100
    )
  
  ggplot(dool_processed, aes(x = time, y = Memory_percent_used)) +
    labs(title = "", x = "Time (s)", y = "Mem %") + # Shorter Y-axis label
    geom_line(color = "DarkOrange", linewidth = 0.75) + 
    scale_x_continuous(breaks = scales::pretty_breaks(n = 5)) + # Fewer breaks
    scale_y_continuous(limits = c(0, 100), breaks = seq(0, 100, 50), labels = as.integer) + # Fewer breaks
    theme_classic() +
    theme(legend.position = "none", plot.title = element_blank(),
          axis.text.x = element_text(size = 8), axis.text.y = element_text(size = 8),
          axis.title.x = element_text(size = 9), axis.title.y = element_text(size = 9))
}


### Function to generate dool plots
generate_dool_ggplot <- function(logs_to_plot, save_directory) {
  
  # Ensure save directory exists
  if (!dir.exists(save_directory)) {
    dir.create(save_directory, recursive = TRUE)
  }
  
  # Existing plot lists (titles removed in their respective functions)
  plot_list_memory <- list()
  plot_list_cpu <- list()
  plot_list_virt <- list()
  plot_list_combined <- list() # For the original combined CPU/Mem % plot
  all_combined_stats <- list() 
  
  # New lists for the assembler-wise stacked figure
  assembler_labels_grobs <- list()
  plot_list_cpu_perc_new <- list()
  plot_list_mem_perc_new <- list()
  plot_list_virt_mem_new <- list() 
  
  i <- 1
  for (logg in logs_to_plot) {
    # Generate plots for existing figures 
    plot_list_memory[[i]] <- make_dool_plot_memory(logg[[1]], logg[[2]], logg[[3]])
    plot_list_cpu[[i]] <- make_dool_plot_cpu(logg[[1]], logg[[2]], logg[[3]])
    plot_list_virt[[i]] <- make_dool_plot_virtmemory(logg[[1]], logg[[2]], logg[[3]])
    
    # Original combined CPU/Mem % plot
    combined_result <- make_dool_plot_cpu_mem_percentage(logg[[1]], logg[[2]], logg[[3]])
    plot_list_combined[[i]] <- combined_result$plot
    all_combined_stats[[i]] <- combined_result$stats 
    
    # Generate plots for the NEW assembler-wise stacked figure
    # Assembler label (rotated 90 degrees)
    assembler_labels_grobs[[i]] <- grid::textGrob(logg[[2]], 
                                                  gp = grid::gpar(fontsize = 14, fontface = "bold"), 
                                                  rot = 90, 
                                                  just = "center", # Ensure text is centered after rotation
                                                  x = 0.5, y = 0.5) 
    plot_list_cpu_perc_new[[i]] <- make_dool_plot_cpu_percentage(logg[[1]], logg[[2]], logg[[3]])
    plot_list_mem_perc_new[[i]] <- make_dool_plot_memory_percentage(logg[[1]], logg[[2]], logg[[3]])
    plot_list_virt_mem_new[[i]] <- make_dool_plot_virtmemory(logg[[1]], logg[[2]], logg[[3]]) 
    
    i <- i + 1
  }
  
  # Arrange existing grids (full_memory, full_cpu, full_virt)
  full_memory <- grid.arrange(grobs = plot_list_memory, ncol = ceiling(length(plot_list_memory) / 2))
  full_cpu <- grid.arrange(grobs = plot_list_cpu, ncol = ceiling(length(plot_list_cpu) / 2))
  full_virt <- grid.arrange(grobs = plot_list_virt, ncol = ceiling(length(plot_list_virt) / 2))
  
  
  # --- Create a single, shared legend for the original combined plots (full_combined) ---
  dummy_combined_plot_for_legend <- make_dool_plot_cpu_mem_percentage(
    dool_log_file = logs_to_plot[[1]][[1]],
    assembler = logs_to_plot[[1]][[2]],
    dataset = logs_to_plot[[1]][[3]]
  )$plot + theme(legend.position = "bottom", legend.key.size = unit(1.5, "cm")) 
  
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
  
  # --- Adjust layout for original combined plots (full_combined) ---
  num_plots_orig_combined <- length(plot_list_combined)
  num_plot_rows_orig_combined <- ceiling(num_plots_orig_combined / 2)
  fixed_ncol_orig_combined <- 2 
  
  all_grobs_orig_combined <- plot_list_combined
  if (!is.null(shared_legend_grob)) {
    all_grobs_orig_combined <- c(all_grobs_orig_combined, list(shared_legend_grob))
  }
  
  plot_indices_start_orig <- 1
  plot_indices_end_orig <- plot_indices_start_orig + num_plots_orig_combined - 1
  legend_idx_orig <- plot_indices_end_orig + 1 
  
  plot_layout_indices_orig <- c(plot_indices_start_orig:plot_indices_end_orig, rep(NA, fixed_ncol_orig_combined * num_plot_rows_orig_combined - num_plots_orig_combined))
  plot_layout_matrix_orig <- matrix(plot_layout_indices_orig, nrow = num_plot_rows_orig_combined, ncol = fixed_ncol_orig_combined, byrow = TRUE)
  
  layout_matrix_final_orig <- plot_layout_matrix_orig 
  if (!is.null(shared_legend_grob)) {
    layout_matrix_final_orig <- rbind(layout_matrix_final_orig, rep(legend_idx_orig, fixed_ncol_orig_combined)) 
  }
  
  legend_height_ratio_orig <- 0.05 
  plots_height_ratio_orig <- 1 - legend_height_ratio_orig
  plot_height_per_row_orig = plots_height_ratio_orig / num_plot_rows_orig_combined
  
  heights_final_orig <- rep(plot_height_per_row_orig, num_plot_rows_orig_combined)
  if (!is.null(shared_legend_grob)) {
    heights_final_orig <- c(heights_final_orig, legend_height_ratio_orig)
  }
  
  full_combined <- grid.arrange(
    grobs = all_grobs_orig_combined,
    layout_matrix = layout_matrix_final_orig,
    heights = heights_final_orig
  )
  
  # --- NEW FIGURE: full_assembler_metrics (Assembler-wise Stacked Metrics) ---
  num_assemblers <- length(logs_to_plot)
  # Columns: Assembler Label | CPU % Plot | Memory % Plot | Virtual Memory Plot
  num_cols_new_figure <- 4 
  
  all_grobs_for_new_figure <- list()
  layout_matrix_for_new_figure <- matrix(NA, nrow = num_assemblers, ncol = num_cols_new_figure)
  
  current_grob_idx <- 1
  for (k in 1:num_assemblers) {
    # Column 1: Assembler Label
    all_grobs_for_new_figure[[current_grob_idx]] <- assembler_labels_grobs[[k]]
    layout_matrix_for_new_figure[k, 1] <- current_grob_idx
    current_grob_idx <- current_grob_idx + 1
    
    # Column 2: CPU Percentage Plot
    all_grobs_for_new_figure[[current_grob_idx]] <- plot_list_cpu_perc_new[[k]]
    layout_matrix_for_new_figure[k, 2] <- current_grob_idx
    current_grob_idx <- current_grob_idx + 1
    
    # Column 3: Memory Percentage Plot
    all_grobs_for_new_figure[[current_grob_idx]] <- plot_list_mem_perc_new[[k]]
    layout_matrix_for_new_figure[k, 3] <- current_grob_idx
    current_grob_idx <- current_grob_idx + 1
    
    # Column 4: Virtual Memory Plot
    all_grobs_for_new_figure[[current_grob_idx]] <- plot_list_virt_mem_new[[k]]
    layout_matrix_for_new_figure[k, 4] <- current_grob_idx
    current_grob_idx <- current_grob_idx + 1
  }
  
  # --- Shared Legends for NEW FIGURE's columns ---
  # CPU Percentage Legend 
  dummy_cpu_perc_legend_plot <- make_dool_plot_cpu_percentage(
    dool_log_file = logs_to_plot[[1]][[1]], assembler="", dataset=""
  ) + geom_line(aes(color = "CPU Usage"), linewidth = 0.75) + 
    scale_color_manual(name = "", values = c("CPU Usage" = "DarkOrchid")) + 
    theme(legend.position = "bottom", legend.key.size = unit(1.5, "cm"))
  shared_legend_cpu_perc <- extract_legend(dummy_cpu_perc_legend_plot)
  
  # Memory Percentage Legend 
  dummy_mem_perc_legend_plot <- make_dool_plot_memory_percentage(
    dool_log_file = logs_to_plot[[1]][[1]], assembler="", dataset=""
  ) + geom_line(aes(color = "Memory Usage"), linewidth = 0.75) + 
    scale_color_manual(name = "", values = c("Memory Usage" = "DarkOrange")) +
    theme(legend.position = "bottom", legend.key.size = unit(1.5, "cm"))
  shared_legend_mem_perc <- extract_legend(dummy_mem_perc_legend_plot)
  
  # Virtual Memory Legend 
  dummy_virt_mem_legend_plot <- make_dool_plot_virtmemory(
    dool_log_file = logs_to_plot[[1]][[1]], assembler="", dataset=""
  ) + theme(legend.position = "bottom", legend.key.size = unit(1.5, "cm"))
  shared_legend_virt_mem <- extract_legend(dummy_virt_mem_legend_plot)
  
  # Combine all shared legends into one horizontal grob for the bottom row
  all_shared_legends_new_figure <- list() # Use list() for c() to work properly with grobs
  if (!is.null(shared_legend_cpu_perc)) all_shared_legends_new_figure <- c(all_shared_legends_new_figure, list(shared_legend_cpu_perc))
  if (!is.null(shared_legend_mem_perc)) all_shared_legends_new_figure <- c(all_shared_legends_new_figure, list(shared_legend_mem_perc))
  if (!is.null(shared_legend_virt_mem)) all_shared_legends_new_figure <- c(all_shared_legends_new_figure, list(shared_legend_virt_mem))
  
  combined_legends_grob_new_figure <- NULL
  if (length(all_shared_legends_new_figure) > 0) {
    combined_legends_grob_new_figure <- gtable_row(
      name = "combined_legends_new_figure",
      grobs = all_shared_legends_new_figure,
      widths = unit(rep(1, length(all_shared_legends_new_figure)), "null")
    )
  }
  
  # Final layout for the new figure: plots + optional combined legends
  final_grobs_new_figure <- c(all_grobs_for_new_figure)
  layout_matrix_final_new_figure <- layout_matrix_for_new_figure # Start with plot layout
  
  if (!is.null(combined_legends_grob_new_figure)) {
    final_grobs_new_figure <- c(final_grobs_new_figure, list(combined_legends_grob_new_figure))
    legend_row_idx_new_figure <- length(final_grobs_new_figure)
    layout_matrix_final_new_figure <- rbind(layout_matrix_final_new_figure, rep(legend_row_idx_new_figure, num_cols_new_figure))
  }
  
  # Heights for new figure: proportional for plots, small for legend
  plot_row_height_new_figure <- (1 - (0.05 * (!is.null(combined_legends_grob_new_figure)))) / num_assemblers
  heights_new_figure <- c(rep(plot_row_height_new_figure, num_assemblers))
  if (!is.null(combined_legends_grob_new_figure)) {
    heights_new_figure <- c(heights_new_figure, 0.05)
  }
  
  full_assembler_metrics <- grid.arrange(
    grobs = final_grobs_new_figure,
    layout_matrix = layout_matrix_final_new_figure,
    heights = heights_new_figure,
    widths = c(0.08, 0.30, 0.30, 0.32) 
  )
  
  # Saving plots
  ggsave(paste(save_directory, "dool_memory.png", sep = ""), full_memory, width = 12, height = 8)
  ggsave(paste(save_directory, "dool_cpu.png", sep = ""), full_cpu, width = 12, height = 8)
  ggsave(paste(save_directory, "dool_virt.png", sep = ""), full_virt, width = 12, height = 8)
  ggsave(paste(save_directory, "dool_cpu_mem_percentage.png", sep = ""), full_combined, width = 12, height = 8)
  ggsave(paste(save_directory, "dool_assembler_stacked_metrics.png", sep = ""), full_assembler_metrics, width = 18, height = 3.5 * num_assemblers) 
  
  # --- Print collected statistics to console ---
  cat("\n--- CPU & RAM Usage Statistics ---\n")
  stats_df <- bind_rows(all_combined_stats)
  print(stats_df)
  cat("----------------------------------\n")
  
  return (list(full_memory = full_memory, full_cpu = full_cpu, full_virt = full_virt, 
               full_combined = full_combined, full_assembler_metrics = full_assembler_metrics))
}