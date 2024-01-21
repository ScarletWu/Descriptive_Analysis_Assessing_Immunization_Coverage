#### Preamble ####
# Purpose: Simulates immunization data form opendatatoronto
# Author: Ruoxian Wu
# Date: 21 January 2023
# Contact: scarletruoxian.wu@utoronto.ca
# License: MIT
# Pre-requisites: 
install.packages("opendatatoronto")
install.packages("tidyverse")
install.packages("dplyr")

#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(dplyr)


# Set seed for reproducibility
set.seed(123)

# Number of records to simulate
# num_records is chosen to match the size of the original dataset.
num_records <- 800

# Simulating data
simulated_data <- data.frame(
  _id = 1:num_records,
  SchoolName = paste("School", 1:num_records, sep = "_"),
  EnrolledPopulation = sample(50:1500, num_records, replace = TRUE),
  DTPCoverageRate = runif(num_records, min = 70, max = 100),
  DTPReligiousExemptionRate = runif(num_records, min = 0, max = 5),
  MMRCoverageRate = runif(num_records, min = 70, max = 100),
  MMRReligiousExemptionRate = runif(num_records, min = 0, max = 5),
  Lat = runif(num_records, min = 43.6, max = 43.9),
  Lng = runif(num_records, min = -79.5, max = -79.1)
)

