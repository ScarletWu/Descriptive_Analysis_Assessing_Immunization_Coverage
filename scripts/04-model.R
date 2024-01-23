#### Preamble ####
# Purpose: Models immunization dataset.
# Author: Ruoxian Wu
# Date: 22 Januarry 2024
# Contact: scarletruoxian.wu@utoronto.ca
# Pre-requisites: 
#install.packages("tidyverse")
#install.packages("broom")
#install.packages("ggplot2")




#### Workspace setup ####
library(tidyverse)
library(ggplot2)
library(broom)

#### Read data ####
analysis_data <- read_csv("outputs/data/analysis_data.csv")
analysis_data

#### analyse real data ####

descriptive_stats2 <- analysis_data %>%
  summarise(
    across(c(enrolled_population,
             dtp_coverage_rate_percent,
             dtp_religious_exemption_rate_percent, 
             mmr_coverage_rate_percent,
             mmr_religious_exemption_rate_percent),
           list(mean = ~mean(., na.rm = TRUE), 
                sd = ~sd(., na.rm = TRUE), 
                min = ~min(., na.rm = TRUE), 
                max = ~max(., na.rm = TRUE)))
  )

print(descriptive_stats2)

# Correlation Analysis
correlation_matrix2 <- cor(analysis_data %>% 
                             select(enrolled_population,
                                    dtp_coverage_rate_percent,
                                    dtp_religious_exemption_rate_percent, 
                                    mmr_coverage_rate_percent,
                                    mmr_religious_exemption_rate_percent,
                             ))
print(correlation_matrix2)


### Model data ####

DTP_hist <- hist(analysis_data$dtp_coverage_rate_percent,
     main = "Histogram of DTP Coverage Rate", 
     xlab = "DTP Coverage Rate (%)", breaks = 30)

MMR_hist <- hist(analysis_data$mmr_coverage_rate_percent,
     main = "Histogram of MMR Coverage Rate", 
     xlab = "MMR Coverage Rate (%)", breaks = 30)

#### Save model ####
saveRDS(
  DTP_hist,
  file = "outputs/models/first_model.rds"
)

saveRDS(
  MMR_hist,
  file = "outputs/models/second_model.rds"
)

