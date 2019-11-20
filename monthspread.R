
library(lubridate)
library(tidyverse)

months15 <- read_csv(file = "raw-data/CrimeData-2015.csv", col_types = cols(
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

months15 <- months15 %>%
  mutate(OccurDate = mdy(OccurDate)) %>%
  mutate(ReportDate = mdy(ReportDate))

months15 <- months15 %>%
  mutate(OccurYear = year(OccurDate)) %>%
  mutate(OccurMonth = month(OccurDate))

monthspread15 <- months15 %>%
  filter(OccurYear == 2015) %>%
  group_by(OccurMonth) %>%
  count()

plotmonths15 <- ggplot(monthspread15, aes(x = OccurMonth, y = n)) +
  geom_line() +
  theme_minimal() +
  labs(
    title = "Number of Total Crimes Over Months in 2015",
    subtitle = "Significantly lower numbers in early months"
  ) +
  xlab("Month") +
  ylab("Number of Crimes Reported") +
  geom_smooth(method = "lm", se = FALSE) +
  scale_y_continuous(limits = c(0, NA))

months16 <- read_csv(file = "raw-data/CrimeData-2016.csv", col_types = cols(
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

months16 <- months16 %>%
  mutate(OccurDate = mdy(OccurDate)) %>%
  mutate(ReportDate = mdy(ReportDate))

months16 <- months16 %>%
  mutate(OccurYear = year(OccurDate)) %>%
  mutate(OccurMonth = month(OccurDate))

monthspread16 <- months16 %>%
  filter(OccurYear == 2016) %>%
  group_by(OccurMonth) %>%
  count()

plotmonths16 <- ggplot(monthspread16, aes(x = OccurMonth, y = n)) +
  geom_line() +
  theme_minimal() +
  labs(
    title = "Number of Total Crimes Over Months in 2016",
    subtitle = "General increase over time with significant dropoff in December",
    caption = "2016 graph scaled on y axis to show dynamism."
  ) +
  xlab("Month") +
  ylab("Number of Crimes Reported") +
  geom_smooth(method = "lm", se = FALSE)

months17 <- read_csv(file = "raw-data/CrimeData-2017.csv", col_types = cols(
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

months17 <- months17 %>%
  mutate(OccurDate = mdy(OccurDate)) %>%
  mutate(ReportDate = mdy(ReportDate))

months17 <- months17 %>%
  mutate(OccurYear = year(OccurDate)) %>%
  mutate(OccurMonth = month(OccurDate))

monthspread17 <- months17 %>%
  filter(OccurYear == 2017) %>%
  group_by(OccurMonth) %>%
  count()

plotmonths17 <- ggplot(monthspread17, aes(x = OccurMonth, y = n)) +
  geom_line() +
  theme_minimal() +
  labs(
    title = "Number of Total Crimes Over Months in 2017",
    subtitle = "January and December show lulls in reported crime.",
    caption = "2017 graph scaled on y axis to show dynamism."
  ) +
  xlab("Month") +
  ylab("Number of Crimes Reported") +
  geom_smooth(method = "lm", se = FALSE)

months18 <- read_csv(file = "raw-data/CrimeData-2018.csv", col_types = cols(
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

months18 <- months18 %>%
  mutate(OccurDate = mdy(OccurDate)) %>%
  mutate(ReportDate = mdy(ReportDate))

months18 <- months18 %>%
  mutate(OccurYear = year(OccurDate)) %>%
  mutate(OccurMonth = month(OccurDate))

monthspread18 <- months18 %>%
  filter(OccurYear == 2018) %>%
  group_by(OccurMonth) %>%
  count()

plotmonths18 <- ggplot(monthspread18, aes(x = OccurMonth, y = n)) +
  geom_line() +
  theme_minimal() +
  labs(
    title = "Number of Total Crimes Over Months in 2018",
    subtitle = "Feburary and December show lulls in reported crime.",
    caption = "2018 graph scaled on y axis to show dynamism."
  ) +
  xlab("Month") +
  ylab("Number of Crimes Reported") +
  geom_smooth(method = "lm", se = FALSE)

months19 <- read_csv(file = "raw-data/CrimeData-2019.csv", col_types = cols(
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

months19 <- months19 %>%
  mutate(OccurDate = mdy(OccurDate)) %>%
  mutate(ReportDate = mdy(ReportDate))

months19 <- months19 %>%
  mutate(OccurYear = year(OccurDate)) %>%
  mutate(OccurMonth = month(OccurDate))

monthspread19 <- months19 %>%
  filter(OccurYear == 2019) %>%
  group_by(OccurMonth) %>%
  count()

plotmonths19 <- ggplot(monthspread19, aes(x = OccurMonth, y = n)) +
  geom_line() +
  theme_minimal() +
  labs(
    title = "Number of Total Crimes Over Months in Jan. through Sept. 2019",
    subtitle = "Feburary and September show lulls in reported crime.",
    caption = "2019 graph scaled on y axis to show dynamism.
       This data is pulled from a file that includes only year-to-date data for 2019.
       September lull may be attributed to year-to-date nature of data."
  ) +
  xlab("Month") +
  ylab("Number of Crimes Reported") +
  geom_smooth(method = "lm", se = FALSE)
