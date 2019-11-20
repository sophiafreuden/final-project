
library(fs)
library(readxl)
library(tidyverse)

custom <- read_xlsx(path = "raw-data/Crime Rate + Pop.xlsx")

propplot <- ggplot(custom, aes(x = Year, y = PropertyCrimeRt)) +
  geom_line() +
  labs(title = "Property Crime Rate Over Time",
       subtitle = "Sharp Increase Over Time",
       caption = "The rate is number of crimes per 1,000 people.") +
  ylab("Property Crime Rate") +
  theme_minimal() +
  geom_smooth(method = "lm", se = FALSE)

ggsave(filename = "propplot.png", plot = propplot, device = png())

file_copy(
  path = "propplot.png",
  new_path = "finalproject/propplot.png",
  overwrite = TRUE
)

persplot <- ggplot(custom, aes(x = Year, y = PersonCrmRt)) +
  geom_line() +
  labs(title = "Person Crime Rate Over Time",
       subtitle = "Slight Increase Over Time",
       caption = "The rate is number of crimes per 1,000 people.") +
  ylab("Person Crime Rate") +
  theme_minimal() +
  geom_smooth(method = "lm", se = FALSE)

ggsave(filename = "persplot.png", plot = persplot, device = png())

file_copy(
  path = "persplot.png",
  new_path = "finalproject/persplot.png",
  overwrite = TRUE
)

future <- tibble(Year = c(2019, 2020, 2021, 2022, 2023))

model <- lm(PropertyCrimeRt ~ Year, data = custom)

predict(model, newdata = future)

rows <- tibble(PropertyCrimeRt = predict(model, newdata = future),
               Year = c(2019, 2020, 2021, 2022, 2023))

proponly <- custom %>%
  select(PropertyCrimeRt, Year)

proppred <- proponly %>% bind_rows(rows)

proppredplot <- ggplot(proppred, aes(x = Year, y = PropertyCrimeRt)) +
  geom_line() +
  labs(title = "Predicted Property Crime Rate Over Time",
       subtitle = "2019 through 2023 Predicted",
       caption = "The rate is number of crimes per 1,000 people.
       Vertical line denotes start of predicted data.") +
  ylab("Property Crime Rate") +
  theme_minimal() +
  geom_vline(xintercept = 2019, color = "blue")

ggsave(filename = "proppredplot.png", plot = proppredplot, device = png())

file_copy(
  path = "proppredplot.png",
  new_path = "finalproject/proppredplot.png",
  overwrite = TRUE
)



