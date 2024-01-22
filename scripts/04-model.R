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
dtp_lm <- lm(dtp_coverage_rate_percent ~ enrolled_population + 
     dtp_religious_exemption_rate_percent,
   data = analysis_data)
dtp_lm

mmr_lm <- lm(mmr_coverage_rate_percent ~ enrolled_population + 
     mmr_religious_exemption_rate_percent,
   data = analysis_data)
mmr_lm


dtp_coefs <- tidy(dtp_lm)
mmr_coefs <- tidy(mmr_lm)

# Plotting the coefficients for dtp_lm
ggplot(dtp_coefs, aes(x = term, y = estimate)) +
  geom_col() +
  coord_flip() +
  labs(title = "Coefficients of the DTP Linear Model",
       x = "Terms",
       y = "Estimates")

# Plotting the coefficients for mmr_lm
ggplot(mmr_coefs, aes(x = term, y = estimate)) +
  geom_col() +
  coord_flip() +
  labs(title = "Coefficients of the MMR Linear Model",
       x = "Terms",
       y = "Estimates")

#### Save model ####
saveRDS(
  first_model,
  file = "outputs/models/first_model.rds"
)


