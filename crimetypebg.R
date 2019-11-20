library(tidyverse)

crime15 <- read_csv(file = "raw-data/CrimeData-2015.csv", col_types = cols(
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

crime16 <- read_csv(file = "raw-data/CrimeData-2016.csv", col_types = cols(
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

crime17 <- read_csv(file = "raw-data/CrimeData-2017.csv", col_types = cols(
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

crime19 <- read_csv(file = "raw-data/CrimeData-2019.csv", col_types = cols(
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

ggplot(crime19, aes(x = OffenseCategory)) + geom_bar() + coord_flip()

crime15$Year <- 2015

crime16$Year <- 2016

crime17$Year <- 2017

crime18$Year <- 2018

crime19$Year <- 2019

pers_crime15 <- crime15 %>% filter(CrimeAgainst == "Person")

pers_crime16 <- crime16 %>% filter(CrimeAgainst == "Person")

pers_crime17 <- crime17 %>% filter(CrimeAgainst == "Person")

pers_crime18 <- crime18 %>% filter(CrimeAgainst == "Person")

pers_crime19 <- crime19 %>% filter(CrimeAgainst == "Person")

soc_crime15 <- crime15 %>% filter(CrimeAgainst == "Society")

soc_crime16 <- crime16 %>% filter(CrimeAgainst == "Society")

soc_crime17 <- crime17 %>% filter(CrimeAgainst == "Society")

soc_crime18 <- crime18 %>% filter(CrimeAgainst == "Society")

soc_crime19 <- crime19 %>% filter(CrimeAgainst == "Society")

prop_crime15 <- crime15 %>% filter(CrimeAgainst == "Property")

prop_crime16 <- crime16 %>% filter(CrimeAgainst == "Property")

prop_crime17 <- crime17 %>% filter(CrimeAgainst == "Property")

prop_crime18 <- crime18 %>% filter(CrimeAgainst == "Property")

prop_crime19 <- crime19 %>% filter(CrimeAgainst == "Property")

allPersCrime <- bind_rows(pers_crime15, pers_crime16, pers_crime17, pers_crime18, pers_crime19)

allSocCrime <- bind_rows(soc_crime15, soc_crime16, soc_crime17, soc_crime18, soc_crime19)

allPropCrime <- bind_rows(prop_crime15, prop_crime16, prop_crime17, prop_crime18, prop_crime19)

ggplot(allPersCrime, aes(x = OffenseCategory)) + geom_bar() + coord_flip()

ggplot(allPersCrime, aes(x = OffenseType)) + geom_bar() + coord_flip() + scale_y_log10()

ggplot(allSocCrime, aes(x = OffenseType)) + geom_bar() + coord_flip() + scale_y_log10()

ggplot(allPropCrime, aes(x = OffenseType)) + geom_bar() + coord_flip() + scale_y_log10()

