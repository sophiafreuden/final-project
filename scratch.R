library(tidyverse)
library(readxl)

x <- read_csv(file = "raw-data/CrimeData-2018.csv", col_types = cols(
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

sample <- x %>% sample_n(10)
sample %>% mutate(OccurDate = mdy(OccurDate))

x <- x %>%
  mutate(OccurDate = mdy(OccurDate)) %>%
  mutate(ReportDate = mdy(ReportDate))

sample2 <- x %>% sample_n(10)
sample3 <- sample2 %>% mutate(ReportYear = year(ReportDate))

x <- x %>% mutate(OccurYear = year(OccurDate))
x <- x %>% mutate(OccurMonth = month(OccurDate))

monthspread <- x %>% group_by(OccurMonth) %>% count()

ggplot(monthspread, aes(x = OccurMonth, y = n)) + geom_line()

y <- read_xlsx(path = "raw-data/BLS PDX Unemployment.xlsx")

y$Avg <- rowMeans(y[,2:13], na.rm=TRUE)

y <- y %>% mutate(Avg = round(Avg, digits = 1))
