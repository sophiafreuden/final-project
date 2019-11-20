
library(fs)
library(tidyverse)

pop <- read_csv("raw-data/2010-2018 census pop estimates.csv", col_types = cols(
  Year = col_double(),
  PopulationCen = col_double()
))

popplot <- ggplot(pop, aes(x = Year, y = PopulationCen)) +
  geom_line() +
  ylab("Population") +
  labs(
    title = "Population of Portland Metropolitan Area from 2010 to 2018",
    subtitle = "Dyanmic growth in past decade or so.",
    caption = "Scaled on y axis to show dynamism."
  ) +
  theme_minimal()

ggsave(filename = "popplot.png", plot = popplot, device = png())

file_copy(
  path = "popplot.png",
  new_path = "finalproject/popplot.png",
  overwrite = TRUE
)

popplot2 <- ggplot(pop, aes(x = Year, y = PopulationCen)) +
  geom_line() +
  ylab("Population") +
  labs(
    title = "Population of Portland Metropolitan Area from 2010 to 2018",
    caption = "This version is not scaled on the y axis."
  ) +
  scale_y_continuous(limits = c(0, NA)) +
  theme_minimal()

ggsave(filename = "popplot2.png", plot = popplot2, device = png())

file_copy(
  path = "popplot2.png",
  new_path = "finalproject/popplot2.png",
  overwrite = TRUE
)

popmodel <- lm(formula = PopulationCen ~ Year, data = pop)

popfuture <- tibble(Year = c(2019, 2020, 2021, 2022, 2023))

predict(popmodel, newdata = popfuture)

poprows <- tibble(
  PopulationCen = predict(popmodel, newdata = popfuture),
  Year = c(2019, 2020, 2021, 2022, 2023)
)

poprows <- poprows %>%
  mutate(PopulationCen = round(PopulationCen, digits = 0))

poppred <- pop %>% bind_rows(poprows)

poppredplot <- ggplot(poppred, aes(x = Year, y = PopulationCen)) +
  geom_line() +
  labs(
    title = "Predicted Population Change Over Time",
    subtitle = "2019 through 2023 Predicted",
    caption = "Scaled on y axis to show dynamism.
    Vertical line denotes start of predicted data."
  ) +
  ylab("Population") +
  theme_minimal() +
  geom_vline(xintercept = 2019, color = "blue")

ggsave(filename = "poppredplot.png", plot = poppredplot, device = png())

file_copy(
  path = "poppredplot.png",
  new_path = "finalproject/poppredplot.png",
  overwrite = TRUE
)

poppredplot2 <- ggplot(poppred, aes(x = Year, y = PopulationCen)) +
  geom_line() +
  labs(
    title = "Predicted Population Change Over Time",
    subtitle = "2019 through 2023 Predicted",
    caption = "Not Scaled on y axis.
    Vertical line denotes start of predicted data."
  ) +
  ylab("Population") +
  theme_minimal() +
  geom_vline(xintercept = 2019, color = "blue") +
  scale_y_continuous(limits = c(0, NA))

ggsave(filename = "poppredplot2.png", plot = poppredplot2, device = png())

file_copy(
  path = "poppredplot2.png",
  new_path = "finalproject/poppredplot2.png",
  overwrite = TRUE
)
