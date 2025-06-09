library(tidyverse)

gf_raw <- read.csv("data/sr-even_results-genome_fraction.csv")

# Convert to long format
gf_long <- gf_raw %>%
  pivot_longer(
    cols = c("MEGAHIT", "MetaSPAdes", "Unicycler"),
    names_to = "Variable",       # Name of the new column to store the original column names
    values_to = "Value"          # Name of the new column to store the values
  ) %>% 
  mutate(Reference.Genome = fct_reorder(Reference.Genome, Value, .fun = max, .desc = FALSE)) # Sort in ascending order of max value by default


plot_ggplot <- ggplot(data = gf_long,
       aes(x = Reference.Genome,
           y = Value,
           col = Variable)) +
  geom_point(position = position_jitter(width = 0.13, height = 0),
             size = 4) +
  # 1. Rename xlab and ylab
  labs(x = "Reference Genome", # Your desired X-axis label
       y = "Genome Fraction",
       color = "Assembly Method") + # NEW: Rename the legend title (since 'col' created it)) +   # Your desired Y-axis label
  # 2. Rotate x-axis labels
  theme(axis.text.x = element_text(angle = 35, # Rotate by 35 degrees
                                   hjust = 1,  # Horizontal justification: 1 aligns the right end of the label with the tick
                                   vjust = 1),
        legend.position = "left") # Vertical justification: 1 aligns the top of the label with the tick




# Save the plot
ggsave(filename = "exploratory/sr-even/sr-even_gf.png",
       plot = plot_ggplot,
       width = 12,
       height = 8,
       dpi = 300)



