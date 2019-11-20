
library(shiny)
library(readxl)
library(lubridate)
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

ui <- fluidPage(
  navbarPage(
    "Growing Pains in Portland: A Story of Crime, Unemployment, and Population",
    tabPanel(
      "Crime",
      tabsetPanel(
        tabPanel(
          "Victims in 2018",
          h3("Crime in 2018 by Victim Type"),
          br(),
          sidebarPanel(
            selectInput(
              inputId = "victim",
              "Victim type:", choices = c("Person", "Society", "Property")
            ),
            h6("Crimes against property far outnumber crimes against people or society."),
            h6("Crimes against property are also more diverse in type, though most are varying
                   types of theft.")
          )
        ),
        mainPanel(
          plotOutput(outputId = "victimbar"),
          br()
        )
      )
    )
  )
)


server <- function(input, output) {
  output$victimbar <- renderPlot({
    crime18 %>%
      filter(CrimeAgainst == input$victim) %>%
      ggplot(aes(x = OffenseType)) +
      geom_bar() +
      coord_flip() +
      scale_y_log10()
  })
}

shinyApp(ui = ui, server = server)
