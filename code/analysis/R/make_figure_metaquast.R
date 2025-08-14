

library(tidyverse)
library(ggplot2)

{
  short_hand_reference_names <- data.frame("Long" = NA,
                                           "Short" = NA)
  
  short_hand_reference_names <- rbind(short_hand_reference_names,
                                      c("Bacillus_subtilis_complete_genome", "Bacillus"),
                                      c("Enterococcus_faecalis_complete_genome", "Enterococcus"),
                                      c("Escherichia_coli_complete_genome", "Escherichia"),
                                      c("Listeria_monocytogenes_complete_genome", "Listeria"),
                                      c("Pseudomonas_aeruginosa_complete_genome", "Pseudomonas"),
                                      c("Saccharomyces_cerevisiae_draft_genome", "Saccharomyces"),
                                      c("Salmonella_enterica_complete_genome", "Salmonella"),
                                      c("Staphylococcus_aureus_complete_genome", "Staphylococcus"),
                                      c("not_aligned", "Not Aligned"),
                                      c("Cohaesibacter_es.047_2615840601", "C. es. 047"),
                                      c("Halomonas_HL−4_2623620617", "H. hl-4"),
                                      c("Marinobacter_LV10MA510−1_2616644829", "M. LV10MA510"),
                                      c("Micromonospora_coxensis_2623620609", "M. coxensis"),
                                      c("Micromonospora_echinaurantiaca_2623620557", "M. echinaurantiaca"),
                                      c("Micromonospora_echinofusca_2623620567", "M. echinofusca"),
                                      c("Muricauda_ES.050_2615840527", "M. ES.050"),
                                      c("Propionibacteriaceae_bacterium_ES.041_2615840646", "P. bacterium-ES.041"),
                                      c("Psychrobacter_LV10R520−6_2617270709", "P. LV10R520"),
                                      c("GCF_000005845.2_Escherichia_coli", "Escherichia"),
                                      c("GCF_000006765.1_Pseudomonas_aeruginosa", "Pseudomonas"),
                                      c("GCF_000006945.2_Salmonella_enteric", "Salmonella"),
                                      c("GCF_000009045.1_Bacillus_subtilis", "Bacillus"),
                                      c("GCF_000013425.1_Staphylococcus_aureus", "Staphylococcus"),
                                      c("GCF_000393015.1_Enterococcus_faecalis", "Enterococcus"),
                                      c("GCF_000196035.1_Listeria_monocytogenes", "Listeria"),
                                      c("GCF_000091045.1_Cryptococcus_neoformans", "Cryptococcus"),
                                      c("Psychrobacter_LV10R520-6_2617270709", "Psychrobacter"),
                                      c("bsubtilis_pb", "Bacillus"),
                                      c("ecoli_pb", "Escherichia"),
                                      c("efaecalis_pb", "Enterococcus"),
                                      c("lmonocytogenes_pb", "Listeria"),
                                      c("paeruginosa_pb", "Pseudomonas"),
                                      c("saureus_pb", "Staphylococcus"),
                                      c("scerevisiae_pb", "Saccharomyces"),
                                      c("senterica_pb", "Salmonella"))
  
}


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

  
    ## Shorten names using a dataframe specified 
    dataset_for_plotting <- dataset_for_plotting %>%
      left_join(short_hand_reference_names, by = c("reference" = "Long")) %>%
      mutate(reference = Short)
    
    ### The actual plot for each metric
    plot <- ggplot(data = dataset_for_plotting,
           aes(x = Short, 
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
           x = "Reference Organism",
           y = gsub("_", " ", metric)) + 
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

