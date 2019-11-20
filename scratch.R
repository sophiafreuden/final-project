library(tidyverse)
library(readxl)
library(lubridate)

x <- read_csv(file = "cleaned-data/CrimeData-2018.csv", col_types = cols(
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

Unemp <- read_xlsx(path = "cleaned-data/BLS PDX Unemployment.xlsx")

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

Unemp2 <- Unemp2 %>%
  mutate(r2009 = `2009`) %>%
  mutate(r2010 = `2010`) %>%
  mutate(r2011 = `2011`) %>%
  mutate(r2012 = `2012`) %>%
  mutate(r2013 = `2013`) %>%
  mutate(r2014 = `2014`) %>%
  mutate(r2015 = `2015`) %>%
  mutate(r2016 = `2016`) %>%
  mutate(r2017 = `2017`) %>%
  mutate(r2018 = `2018`) %>%
  mutate(r2019 = `2019`) %>%
  select(-`2009`,
         -`2010`,
         -`2011`,
         -`2012`,
         -`2013`,
         -`2014`,
         -`2015`,
         -`2016`,
         -`2017`,
         -`2018`,
         -`2019`)

Unemp3 <- Unemp %>%
  gather(`Jan`,
         `Feb`,
         `Mar`,
         `Apr`,
         `May`,
         `Jun`,
         `Jul`,
         `Aug`,
         `Sep`,
         `Oct`,
         `Nov`,
         `Dec`,
         key = "Month",
         value = "Rate") %>%
  spread(key = "Year",
         value = "Rate") %>%
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
  )) %>%
  mutate(r2009 = `2009`) %>%
  mutate(r2010 = `2010`) %>%
  mutate(r2011 = `2011`) %>%
  mutate(r2012 = `2012`) %>%
  mutate(r2013 = `2013`) %>%
  mutate(r2014 = `2014`) %>%
  mutate(r2015 = `2015`) %>%
  mutate(r2016 = `2016`) %>%
  mutate(r2017 = `2017`) %>%
  mutate(r2018 = `2018`) %>%
  mutate(r2019 = `2019`) %>%
  select(-`2009`,
         -`2010`,
         -`2011`,
         -`2012`,
         -`2013`,
         -`2014`,
         -`2015`,
         -`2016`,
         -`2017`,
         -`2018`,
         -`2019`) %>%
  ggplot(aes(x = Month, y = input$year)) +
  geom_line() +
  theme_minimal()

# scale_x_continuous(breaks = c(2012, 2013, etc.)

# scale_fill_manual(values = c("Assault" = "cadetblue", etc.))

dummy2 <- crime18 %>%
  filter(CrimeAgainst == "Society") %>%
  ggplot(aes(x = OffenseType, fill = OffenseType)) +
  geom_bar(show.legend = FALSE) +
  coord_flip() +
  scale_y_log10() +
  ylab("Count") +
  labs(caption = "test") +
  theme_minimal()

png("dummy2.png")
dummy2
dev.off()

file_copy(
  path = "dummy2.png",
  new_path = "pdx-probs/www/dummy2.png",
  overwrite = TRUE
)




# png("graphics/plotname.png")
# plotname
# dev.off()