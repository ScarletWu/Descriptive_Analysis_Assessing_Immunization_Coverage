#### Preamble ####
# Purpose: Simulates immunization data form opendatatoronto
# Author: Ruoxian Wu
# Date: 21 January 2023
# Contact: scarletruoxian.wu@utoronto.ca
# Pre-requisites: 
#install.packages("tidyverse")
#install.packages("dplyr")
#install.packages("janitor")


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(dplyr)
library(janitor)


# Set seed for reproducibility
set.seed(123)

# Number of records to simulate
# num_records is chosen to match the size of the original dataset.
num_records <- 806

# Simulating data
simulated_data <- data.frame(
  id = 1:num_records,
  SchoolName = paste("School", 1:num_records, sep = "_"),
  EnrolledPopulation = sample(50:1500, num_records, replace = TRUE),
  DTPCoverageRate = runif(num_records, min = 70, max = 100),
  DTPReligiousExemptionRate = runif(num_records, min = 0, max = 5),
  MMRCoverageRate = runif(num_records, min = 70, max = 100),
  MMRReligiousExemptionRate = runif(num_records, min = 0, max = 5)
)

head(simulated_data)
