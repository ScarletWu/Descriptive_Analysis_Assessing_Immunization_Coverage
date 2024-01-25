#### Preamble ####
# Purpose: Tests cleaned immunization dataset.
# Author: Ruoxian Wu
# Date: 22 Januarry 2024
# Contact: scarletruoxian.wu@utoronto.ca
# Pre-requisites: 
#install.packages("tidyverse")
#install.packages("dplyr")
#install.packages("ggplot2")
#install.packages("reshape2")

#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(ggplot2)
library(reshape2)

#### Test simulated data ####
simulated_data$id |> min() == 1
simulated_data$id |> max() == 806


descriptive_stats <- simulated_data %>%
  summarise(
    across(c(EnrolledPopulation, DTPCoverageRate, DTPReligiousExemptionRate, 
             MMRCoverageRate, MMRReligiousExemptionRate),
           list(mean = ~mean(., na.rm = TRUE), 
                sd = ~sd(., na.rm = TRUE), 
                min = ~min(., na.rm = TRUE), 
                max = ~max(., na.rm = TRUE)))
  )

print(descriptive_stats)

# Correlation Analysis
correlation_matrix <- cor(simulated_data %>% 
                            select(EnrolledPopulation,
                                   DTPCoverageRate,
                                   DTPReligiousExemptionRate,
                                   MMRCoverageRate,
                                   MMRReligiousExemptionRate,
                                   ))
print(correlation_matrix)


#### Test real data ####

descriptive_stats1718 <- selected_data1718 %>%
  summarise(
    across(c(enrolled_population,
             dtp_coverage_rate,
             dtp_religious_exemption_rate,
             mmr_coverage_rate,
             mmr_religious_exemption_rate),
           list(mean = ~mean(., na.rm = TRUE), 
                sd = ~sd(., na.rm = TRUE), 
                min = ~min(., na.rm = TRUE), 
                max = ~max(., na.rm = TRUE)))
  )

descriptive_stats1819 <- selected_data1819 %>%
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


print(descriptive_stats1718)
print(descriptive_stats1819)

# Correlation Analysis
correlation_matrix1718 <- cor(selected_data1718 %>% 
                            select(enrolled_population,
                                   dtp_coverage_rate,
                                   dtp_religious_exemption_rate, 
                                   mmr_coverage_rate,
                                   mmr_religious_exemption_rate,
                                   ))

correlation_matrix1819 <- cor(selected_data1819 %>% 
                                select(enrolled_population,
                                       dtp_coverage_rate_percent,
                                       dtp_religious_exemption_rate_percent, 
                                       mmr_coverage_rate_percent,
                                       mmr_religious_exemption_rate_percent,
                                ))
print(correlation_matrix1718)
print(correlation_matrix1819)

