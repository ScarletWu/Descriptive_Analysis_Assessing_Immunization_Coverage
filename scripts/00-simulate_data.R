#### Preamble ####
# Purpose: Simulates dinesafe data form opendatatoronto
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

# get package
package <- show_package("99ff3657-b2e7-4005-a6fd-c36838ccc96d")
package

# get all resources for this package
resources <- list_package_resources("99ff3657-b2e7-4005-a6fd-c36838ccc96d")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()

