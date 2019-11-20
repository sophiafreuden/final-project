
library(shiny)
library(readxl)
library(lubridate)
library(tidyverse)

crime18 <- read_csv(file = "cleaned-data/CrimeData-2018.csv", col_types = cols(
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

unemployment <- read_xlsx(path = "cleaned-data/BLS PDX Unemployment.xlsx")

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
          ),
          mainPanel(
            plotOutput(outputId = "victimbar")
          )
        ),
        tabPanel(
          "Victim Distribution",
          h3("Distribution of Crimes per Victim Type from 2015 to 2019"),
          br(),
          # Vertical layout didn't seem to change anything?
          verticalLayout(
            img(src = "crimeag15.png", style = "display: block; margin-left: auto; margin-right: auto;"),
            br(),
            br(),
            img(src = "crimeag16.png", style = "display: block; margin-left: auto; margin-right: auto;"),
            br(),
            br(),
            img(src = "crimeag17.png", style = "display: block; margin-left: auto; margin-right: auto;"),
            br(),
            br(),
            img(src = "crimeag18.png", style = "display: block; margin-left: auto; margin-right: auto;"),
            br(),
            br(),
            img(src = "crimeag19.png", style = "display: block; margin-left: auto; margin-right: auto;"),
            br(),
            br()
          )
        ),
        tabPanel(
          "Crime Rate Over Time",
          h3("Person and Property Crime Rates Over Time, Plus Predictions for 2019 through 2023"),
          imageOutput(outputId = "persplot"),
          imageOutput(outputId = "propplot"),
          imageOutput(outputId = "proppredplot")
        ),
        tabPanel(
          "Crimes Per Month",
          h3("Number of Reported Crimes Per Month from 2015 to 2019"),
          imageOutput(outputId = "plotmonths15"),
          imageOutput(outputId = "plotmonths16"),
          imageOutput(outputId = "plotmonths17"),
          imageOutput(outputId = "plotmonths18"),
          imageOutput(outputId = "plotmonths19")
        ),
        tabPanel(
          "Population",
          h3("Population Growth Over Time and Predictions for 2019 through 2023"),
          imageOutput(outputId = "popplot"),
          imageOutput(outputId = "popplot2"),
          imageOutput(outputId = "poppredplot"),
          imageOutput(outputId = "poppredplot2")
        ),
        tabPanel(
          "Unemployment",
          h3("Unemployment and Crime Rate Over Time")
        )
      )
    ),
    tabPanel(
      "About",
      h3("This is my about page placeholder."),
      img(src = "crimeag15.png")
    )
  )
)




server <- function(input, output) {
  output$victimbar <- renderPlot({
    crime18 %>%
      filter(CrimeAgainst == input$victim) %>%
      ggplot(aes(x = OffenseType, fill = OffenseType)) +
      geom_bar(show.legend = FALSE) +
      coord_flip() +
      scale_y_log10() +
      ylab("Count") +
      labs(caption = "test") +
      theme_minimal()
  })
  output$crimeag15 <- renderImage({
    list(
      src = "crimeag15.png",
      contentType = "image/gif"
    )
  }, deleteFile = FALSE)
  output$crimeag16 <- renderImage({
    list(
      src = "crimeag16.png",
      contentType = "image/gif"
    )
  }, deleteFile = FALSE)
  output$crimeag17 <- renderImage({
    list(
      src = "crimeag17.png",
      contentType = "image/gif"
    )
  }, deleteFile = FALSE)
  output$crimeag18 <- renderImage({
    list(
      src = "crimeag18.png",
      contentType = "image/gif"
    )
  }, deleteFile = FALSE)
  output$crimeag19 <- renderImage({
    list(
      src = "crimeag19.png",
      contentType = "image/gif"
    )
  }, deleteFile = FALSE)
  output$persplot <- renderImage({
    list(
      src = "persplot.png",
      contentType = "image/gif"
    )
  }, deleteFile = FALSE)
  output$propplot <- renderImage({
    list(
      src = "propplot.png",
      contentType = "image/gif"
    )
  }, deleteFile = FALSE)
  output$proppredplot <- renderImage({
    list(
      src = "proppredplot.png",
      contentType = "image/gif"
    )
  }, deleteFile = FALSE)
  output$plotmonths15 <- renderImage({
    list(
      src = "plotmonths15.png",
      contentType = "image/gif"
    )
  }, deleteFile = FALSE)
  output$plotmonths16 <- renderImage({
    list(
      src = "plotmonths16.png",
      contentType = "image/gif"
    )
  }, deleteFile = FALSE)
  output$plotmonths17 <- renderImage({
    list(
      src = "plotmonths17.png",
      contentType = "image/gif"
    )
  }, deleteFile = FALSE)
  output$plotmonths18 <- renderImage({
    list(
      src = "plotmonths18.png",
      contentType = "image/gif"
    )
  }, deleteFile = FALSE)
  output$plotmonths19 <- renderImage({
    list(
      src = "plotmonths19.png",
      contentType = "image/gif"
    )
  }, deleteFile = FALSE)
  output$popplot <- renderImage({
    list(
      src = "popplot.png",
      contentType = "image/gif"
    )
  }, deleteFile = FALSE)
  output$popplot2 <- renderImage({
    list(
      src = "popplot2.png",
      contentType = "image/gif"
    )
  }, deleteFile = FALSE)
  output$poppredplot <- renderImage({
    list(
      src = "poppredplot.png",
      contentType = "image/gif"
    )
  }, deleteFile = FALSE)
  output$poppredplot2 <- renderImage({
    list(
      src = "poppredplot2.png",
      contentType = "image/gif"
    )
  }, deleteFile = FALSE)
}

shinyApp(ui = ui, server = server)
