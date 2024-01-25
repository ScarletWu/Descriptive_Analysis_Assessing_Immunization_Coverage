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
analysis_data1718 <- read_csv("outputs/data/analysis_data1718.csv")
analysis_data1718

analysis_data1819 <- read_csv("outputs/data/analysis_data1819.csv")
analysis_data1819

#### analyse real data ####

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
                                       mmr_religious_exemption_rate
                                ))

correlation_matrix1819 <- cor(selected_data1819 %>% 
                                select(enrolled_population,
                                       dtp_coverage_rate_percent,
                                       dtp_religious_exemption_rate_percent, 
                                       mmr_coverage_rate_percent,
                                       mmr_religious_exemption_rate_percent
                                ))
print(correlation_matrix1718)
print(correlation_matrix1819)



### Model data ####

# 2017-2018
DTP_hist1718 <- hist(analysis_data1718$dtp_coverage_rate,
     main = "Histogram of DTP Coverage Rate", 
     xlab = "DTP Coverage Rate (%)", breaks = 30)

MMR_hist1718 <- hist(analysis_data1718$mmr_coverage_rate,
     main = "Histogram of MMR Coverage Rate", 
     xlab = "MMR Coverage Rate (%)", breaks = 30)

# 2018-2019
DTP_hist1819 <- hist(analysis_data1819$dtp_coverage_rate_percent,
                 main = "Histogram of DTP Coverage Rate", 
                 xlab = "DTP Coverage Rate (%)", breaks = 30)

MMR_hist1819 <- hist(analysis_data1819$mmr_coverage_rate_percent,
                 main = "Histogram of MMR Coverage Rate", 
                 xlab = "MMR Coverage Rate (%)", breaks = 30)


# Visualization
# Boxplots across two years

data_1819 <- analysis_data1819 %>% rename(mmr_coverage_rate = mmr_coverage_rate_percent, dtp_coverage_rate = dtp_coverage_rate_percent)
data_1819

data_combined <- bind_rows(analysis_data1718, data_1819, .id = "year")
data_combined$year <- factor(data_combined$year, labels = c("2017-2018", "2018-2019"))



mmr_box <- ggplot(data_combined, aes(x = year, y = mmr_coverage_rate, fill = year)) +
  geom_boxplot() +
  ggtitle("MMR Coverage Rate Comparison") +
  ylab("MMR Coverage Rate") +
  xlab("School Year")

dtp_box <- ggplot(data_combined, aes(x = year, y = dtp_coverage_rate, fill = year)) +
  geom_boxplot() +
  ggtitle("DTP Coverage Rate Comparison") +
  ylab("DTP Coverage Rate") +
  xlab("School Year")



mmr_box
dtp_box

#### Save model ####
saveRDS(
  DTP_hist1718,
  file = "outputs/models/DTP_hist1718.rds"
)

saveRDS(
  MMR_hist1718,
  file = "outputs/models/MMR_hist1718.rds"
)


saveRDS(
  DTP_hist1819,
  file = "outputs/models/DTP_hist1819.rds"
)

saveRDS(
  MMR_hist1819,
  file = "outputs/models/MMR_hist1819.rds"
)


saveRDS(
  mmr_box,
  file = "outputs/models/mmr_box.rds"
)

saveRDS(
  dtp_box,
  file = "outputs/models/dtp_box.rds"
)


