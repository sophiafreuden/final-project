
library(fs)
library(scales)
library(tidyverse)

a <- read_csv(file = "raw-data/CrimeData-2015.csv", col_types = cols(
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

plot15 <- ggplot(a, aes(x = CrimeAgainst, fill = CrimeAgainst)) +
  geom_bar() +
  labs(title = "Distribution of Crimes per Victim Type in 2015") +
  xlab("Type of Victim") +
  ylab("Count") +
  theme(legend.position = "none")

ggsave(filename = "crimeag15.png", plot = plot15, device = png())

file_copy(
  path = "crimeag15.png",
  new_path = "finalproject/crimeag15.png",
  overwrite = TRUE
)

b <- read_csv(file = "raw-data/CrimeData-2016.csv", col_types = cols(
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

plot16 <- ggplot(b, aes(x = CrimeAgainst, fill = CrimeAgainst)) +
  geom_bar() +
  labs(title = "Distribution of Crimes per Victim Type in 2016") +
  xlab("Type of Victim") +
  ylab("Count") +
  theme(legend.position = "none")

ggsave(filename = "crimeag16.png", plot = plot16, device = png())

file_copy(
  path = "crimeag16.png",
  new_path = "finalproject/crimeag16.png",
  overwrite = TRUE
)

c <- read_csv(file = "raw-data/CrimeData-2017.csv", col_types = cols(
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

plot17 <- ggplot(c, aes(x = CrimeAgainst, fill = CrimeAgainst)) +
  geom_bar() +
  labs(title = "Distribution of Crimes per Victim Type in 2017") +
  xlab("Type of Victim") +
  ylab("Count") +
  theme(legend.position = "none")

ggsave(filename = "crimeag17.png", plot = plot17, device = png())

file_copy(
  path = "crimeag17.png",
  new_path = "finalproject/crimeag17.png",
  overwrite = TRUE
)

d <- read_csv(file = "raw-data/CrimeData-2018.csv", col_types = cols(
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

plot18 <- ggplot(d, aes(x = CrimeAgainst, fill = CrimeAgainst)) +
  geom_bar() +
  labs(title = "Distribution of Crimes per Victim Type in 2018") +
  xlab("Type of Victim") +
  ylab("Count") +
  theme(legend.position = "none")

ggsave(filename = "crimeag18.png", plot = plot18, device = png())

file_copy(
  path = "crimeag18.png",
  new_path = "finalproject/crimeag18.png",
  overwrite = TRUE
)

e <- read_csv(file = "raw-data/CrimeData-2019.csv", col_types = cols(
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

plot19 <- ggplot(e, aes(x = CrimeAgainst, fill = CrimeAgainst)) +
  geom_bar() +
  labs(
    title = "Distribution of Crimes per Victim Type in 2019",
    subtitle = "Year to Date (January through September)"
  ) +
  xlab("Type of Victim") +
  ylab("Count") +
  theme(legend.position = "none")

ggsave(filename = "crimeag19.png", plot = plot19, device = png())

file_copy(
  path = "crimeag19.png",
  new_path = "finalproject/crimeag19.png",
  overwrite = TRUE
)
