#### Preamble ####
# Purpose: Cleans the raw immunization data.
# Author: Ruoxian Wu
# Date: 22 Januarry 2024
# Contact: scarletruoxian.wu@utoronto.ca
# Pre-requisites: 
#install.packages("tidyverse")
#install.packages("janitor")


#### Workspace setup ####
library(tidyverse)
library(janitor)

#### Basic cleaning ####
raw_data1718 <-
  read_csv("/cloud/project/inputs/data/immunization1718.csv")
raw_data1819 <-
  read_csv("/cloud/project/inputs/data/immunization1819.csv")

# Make the names easier to type
cleaned_data1718 <-
  clean_names(raw_data1718)
cleaned_data1718

cleaned_data1819 <-
  clean_names(raw_data1819)
cleaned_data1819


selected_data1718 <-
  cleaned_data1718 |>
  select(
    school_name,
    enrolled_population,
    dtp_coverage_rate,
    dtp_religious_exemption_rate,
    mmr_coverage_rate,
    mmr_religious_exemption_rate
  )
selected_data1718

selected_data1819 <-
  cleaned_data1819 |>
  select(
    school_name,
    enrolled_population,
    dtp_coverage_rate_percent,
    dtp_religious_exemption_rate_percent,
    mmr_coverage_rate_percent,
    mmr_religious_exemption_rate_percent
  )
selected_data1819



#### Save data ####
write_csv(cleaned_data1718, "outputs/data/cleaned_data1718.csv")
write_csv(selected_data1718, "outputs/data/analysis_data1718.csv")

write_csv(cleaned_data1819, "outputs/data/cleaned_data1819.csv")
write_csv(selected_data1819, "outputs/data/analysis_data1819.csv")