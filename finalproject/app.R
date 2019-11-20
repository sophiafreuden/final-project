#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
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
    navbarPage("Growing Pains in Portland: A Story of Crime, Unemployment, and Population",
        tabPanel("Crime",
            tabsetPanel(
                tabPanel("Victims in 2018",
            h3("Crime in 2018 by Victim Type"),
            br(),
            sidebarPanel(
            selectInput(inputId = "victim",
                         "Sample size", value = 25),
            plotOutput(outputId = "hist") 
        )))),
        tabPanel(
            "About",
            h4("About my project"),
            "This is something about my project."
        )
    )
)


server <- function(input, output) {
    output$img <- renderImage({
        list(
            src = "animation.gif",
            contentType = "image/gif"
        )
    }, deleteFile = FALSE)
}

shinyApp(ui = ui, server = server)
