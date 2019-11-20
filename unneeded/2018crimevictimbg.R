library(tidyverse)

crime18 <- read_csv(file = "raw-data/CrimeData-2018.csv", col_types = cols(
  Address = col_character(),
  CaseNumber = col_character(),
  CrimeAgainst = col_character(),
  Neighborhood = col_character(),
  OccurDate = col_character(),
  OccurTime = col_character(),
  OffenseCategory = col_character(),
  OffenseType = col_character(),
  OpenDataLat = col_double(),
  OpenDataLon = col_double(),
  OpenDataX = col_character(),
  OpenDataY = col_character(),
  ReportDate = col_character(),
  OffenseCount = col_double()
))

crime18 %>%
  filter(CrimeAgainst == "Person") %>%
  ggplot(aes(x = OffenseType)) +
  geom_bar() +
  coord_flip() +
  scale_y_log10()

crime18 %>%
  filter(CrimeAgainst == "Property") %>%
  ggplot(aes(x = OffenseType)) +
  geom_bar() +
  coord_flip() +
  scale_y_log10()

crime18 %>%
  filter(CrimeAgainst == "Society") %>%
  ggplot(aes(x = OffenseType)) +
  geom_bar() +
  coord_flip() +
  scale_y_log10()
