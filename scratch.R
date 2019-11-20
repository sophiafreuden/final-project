library(tidyverse)
library(readxl)
library(lubridate)

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

ggplot(x, aes(x = CrimeAgainst)) + geom_bar()

ggsave(filename = "test.png", plot = last_plot(), device = png())

Unemp <- read_xlsx(path = "raw-data/BLS PDX Unemployment.xlsx")

# Unemp$Avg <- rowMeans(y[,2:13], na.rm=TRUE)
# 
# Unemp <- Unemp %>% mutate(Avg = round(Avg, digits = 1))

Unemp <- gather(Unemp, `Jan`, `Feb`, `Mar`, `Apr`, `May`, `Jun`, `Jul`, `Aug`, `Sep`, `Oct`, `Nov`, `Dec`, key = "Month", value = "Rate")

Unemp2 <- spread(Unemp, key = "Year", value = "Rate")

Unemp2 <- Unemp2 %>%
  mutate(Month = case_when(
    Month == "Apr" ~ 4,
    Month == "Aug" ~ 8,
    Month == "Dec" ~ 12,
    Month == "Feb" ~ 2,
    Month == "Jan" ~ 1,
    Month == "Jul" ~ 7,
    Month == "Jun" ~ 6,
    Month == "Mar" ~ 3,
    Month == "May" ~ 5,
    Month == "Nov" ~ 11,
    Month == "Oct" ~ 10,
    Month == "Sep" ~ 9
  ))

Unemp2 <- Unemp2 %>% arrange(Month)
