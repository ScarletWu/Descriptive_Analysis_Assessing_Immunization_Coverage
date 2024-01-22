#### Preamble ####
# Purpose: Cleans the raw data
# Author: Ruoxian Wu
# Date: 22 Januarry 2024
# Contact: scarletruoxian.wu@utoronto.ca
# Pre-requisites: 
#install.packages("tidyverse")


#### Workspace setup ####

#### Basic cleaning ####
raw_data <-
  read_csv("/cloud/project/inputs/data/immunization.csv")

# Make the names easier to type
cleaned_data <-
  clean_names(raw_data)
cleaned_data

selected_data <-
  cleaned_data |>
  select(
    school_name,
    enrolled_population,
    dtp_coverage_rate_percent,
    dtp_religious_exemption_rate_percent,
    mmr_coverage_rate_percent,
    mmr_religious_exemption_rate_percent
  )

head(selected_data)

#### Save data ####
write_csv(cleaned_data, "outputs/data/cleaned_data.csv")