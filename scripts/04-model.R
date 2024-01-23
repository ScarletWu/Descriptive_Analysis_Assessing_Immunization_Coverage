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



### Model data ####

hist(analysis_data$dtp_coverage_rate_percent,
     main = "Histogram of DTP Coverage Rate", 
     xlab = "DTP Coverage Rate (%)", breaks = 30)

hist(analysis_data$mmr_coverage_rate_percent,
     main = "Histogram of MMR Coverage Rate", 
     xlab = "MMR Coverage Rate (%)", breaks = 30)

#### Save model ####
saveRDS(
  first_model,
  file = "outputs/models/first_model.rds"
)


