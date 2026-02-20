# Healthcare Utilization & Revenue Trend Analysis
# Author: Hadana Haile

library(ggplot2)
library(dplyr)
library(readr)

# Load cleaned dataset
df <- read_csv("data/cleaned_dataset.csv")

# Summarize by service type
summary_by_service <- df %>%
  group_by(ServiceType) %>%
  summarise(
    TotalPatients = sum(PatientCount),
    TotalRevenue = sum(Revenue),
    AvgRevenuePerPatient = TotalRevenue / TotalPatients
  ) %>%
  arrange(desc(TotalRevenue))

print(summary_by_service)

# Visualization 1: Total revenue by service type
ggplot(summary_by_service, aes(x = ServiceType, y = TotalRevenue)) +
  geom_col() +
  theme_minimal() +
  labs(
    title = "Total Revenue by Service Type",
    x = "Service Type",
    y = "Total Revenue"
  )

# Visualization 2: Quarterly patient volume trend by service type
ggplot(df, aes(x = Quarter, y = PatientCount, group = ServiceType, color = ServiceType)) +
  geom_line(linewidth = 1) +
  theme_minimal() +
  labs(
    title = "Quarterly Patient Volume Trend",
    x = "Quarter",
    y = "Patient Count",
    color = "Service Type"
  )
