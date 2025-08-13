

library(tidyverse)
library(ggplot2)

make_figure <- function(dataset_in = "",
                        results_data = results_full) {
  
  if (grepl("lr", dataset_in)) {
    read_type <- "Long"
  } else if (grepl("sr", dataset_in)) {
    read_type <- "Short"
  } else {
    print("Wrong dataset")
    break
  }
  
  
  ## Clone variable
  results_raw <- results_data
        
  ### Filter by read type (assembler list)
  filtered_dataset <- results_raw %>%
    dplyr::filter(dataset == dataset_in)
  
  
  ## Print pre-and post
  print(paste("Pre-filtering: ", 
              length(rownames(results_raw))))
  print(paste("Post-filtering :", 
              nrow(filtered_dataset)))
  
  
  for(metric in unique(filtered_dataset$metric_name)) {
    
    references_found <- filtered_dataset %>%
      dplyr::filter(metric_name == metric)
    
    print(paste(length(references_found), "References found for ", metric, " metric"))
    
    # Edge case: All of a value are empty. Skip this iteration if so
    if (all(references_found$metric_value == "-")) {
      next
    }

    
    dataset_for_plotting <- references_found %>%
      dplyr::filter(metric_value != "-")
    
    dataset_for_plotting$test <- factor(dataset_for_plotting$test, 
                                        levels = c("1", "2", "3", "4", "5"))
    
    dataset_for_plotting$metric_value <- as.numeric(dataset_for_plotting$metric_value)
    
    
    ## Plot title
    plot_title <- paste(read_type, 
                        "Reads:",
                        dataset_in,
                        sep = " ") 

    
    
    
    ### The actual plot for each metric
    plot <- ggplot(data = dataset_for_plotting,
           aes(x = reference, 
               y = metric_value,
               shape = assembler, 
               color = assembler)) +
      geom_point(size = 3, 
                 shape = 16,
                 stroke = 1.5,
                 position = position_jitter(width = 0.2)) +
      ## Currently defined as test number
      scale_color_manual(values = c("metaspades" = "red",
                                    "megahit" = "yellow",
                                    "unicycler" = "orange",
                                    "metaflye" = "green",
                                    "canu" = "blue",
                                    "raven" = "violet")) +
      theme_classic() +
      labs(title = plot_title,
           x = "Reference",
           y = metric) + 
      theme(plot.title = element_text(hjust = 0.5, face = "bold"),
            panel.grid.major = element_line(color = "lightgrey", linetype = 1),
            panel.background = element_rect(fill= "white"),
            aspect.ratio = 1,
            legend.position = "bottom",
            plot.subtitle = element_text(hjust = 0.5, size = 14, face = "bold"),
            panel.border = element_rect(colour = "black", fill=NA, size=1),
            axis.text.x = element_text(face = "bold", angle = 90, hjust = 1),
            axis.text.y = element_text(face = "bold"),
            axis.title.x = element_text(face = "bold"),
            axis.title.y = element_text(face = "bold"))
      
    
    
    out_location <- paste("results/figures/metaquast/",
                          dataset_in, 
                          metric, 
                          sep = "/")
    
    out_location <- paste(out_location, 
                          ".pdf", 
                          sep = "")
    
    
    ggsave(out_location,
           device = "pdf")
    print("Saved")
    
  }
  

}

