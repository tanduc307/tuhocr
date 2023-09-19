
source(file = "extract_item_v1.R")

df_1 <- readRDS("crop_production_all_data.rds")

df_2 <- read.csv("FAOSTAT_data_3-21-2023.csv") 


coffee_data <- extract_item_v1(input_rds = df_1, 
                               input_item = "Coffee, green", 
                               input_region = df_2)

library(kableExtra)

kbl(coffee_data) %>%
  kable_styling(bootstrap_options = c("striped", 
                                      "hover", 
                                      "condensed", 
                                      "bordered", 
                                      "responsive")) %>%
  kable_classic(full_width = FALSE, html_font = "arial")
