
library(fs)
library(readxl)
library(tidyverse)

unemp <- read_xlsx(path = "cleaned-data/BLS PDX Unemployment.xlsx")

unemp$Avg <- rowMeans(y[, 2:13], na.rm = TRUE)

unemp <- unemp %>% mutate(Avg = round(Avg, digits = 1))

unempplot <- ggplot(unemp, aes(x = Year, y = Avg)) +
  geom_line() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Unemployment Rate of Portland Metropolitan Area Over Time",
    subtitle = "Post-Recession Era Sees Plummet in Unemployment Rate",
    caption = "Thanks, Obama."
  ) +
  theme_minimal()

ggsave(filename = "unempplot.png", plot = unempplot, device = png())

file_copy(
  path = "unempplot.png",
  new_path = "pdx-probs/unempplot.png",
  overwrite = TRUE
)

custom2 <- read_xlsx(path = "cleaned-data/Crime Rate + Pop.xlsx")

custom2 <- custom2 %>%
  select(Year, PropertyCrimeRt, PersonCrmRt)

unempcrime <- inner_join(unemp, custom2, by = "Year")

unemppropcrime <- ggplot(unempcrime, aes(x = Avg, y = PropertyCrimeRt)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(
    title = "Yearly Property Crime Rate and Yearly Average Unemployment Rate",
    subtitle = "Inverse Relationship between Crime Rate and Unemployment Rate",
    caption = "Property crime rate is the number of property crimes reported per 1,000 people."
  ) +
  theme_minimal() +
  ylab("Property Crime Rate") +
  xlab("Yearly Average Unemployment Rate")

ggsave(filename = "unemppropcrime.png", plot = unemppropcrime, device = png())

file_copy(
  path = "unemppropcrime.png",
  new_path = "pdx-probs/unemppropcrime.png",
  overwrite = TRUE
)

unempperscrime <- ggplot(unempcrime, aes(x = Avg, y = PersonCrmRt)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(
    title = "Yearly Person Crime Rate and Yearly Average Unemployment Rate",
    subtitle = "No Clear Relationship Between Person Crime Rate and Unemployment Rate",
    caption = "Property crime rate is the number of property crimes reported per 1,000 people."
  ) +
  theme_minimal() +
  ylab("Property Crime Rate") +
  xlab("Yearly Average Unemployment Rate")

ggsave(filename = "unempperscrime.png", plot = unempperscrime, device = png())

file_copy(
  path = "unempperscrime.png",
  new_path = "pdx-probs/unempperscrime.png",
  overwrite = TRUE
)
