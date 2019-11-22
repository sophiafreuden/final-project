
# Load all your packages at the top and don't forget to load
# tidyverse last. I'm pretty sure I don't need scales here,
# but I included it just in case.

library(shiny)
library(readxl)
library(scales)
library(lubridate)
library(tidyverse)

# I'm not sure if there's a standard place to load in data,
# but the internet made it seem like the top was a good place
# for it.

# I only have one data set actually loaded into my Shint app.
# The majority of my graphics are rendered as static images
# in Shiny, so I have a lot of code in Rmd files that produces
# and saves the images you see in the app.

# Please note: in total, I am working with over 250,000 rows of
# data. I made the decision to render my graphics as images
# due to the fact that my data files are large and I wanted my
# app to function as well and as quickly as possible.

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

# While the parts that go into the ui and server can be
# complicated, I appreicate the simplicity of how Shiny
# is set up.

# It took quite a bit of messing around with the code in
# the ui to get the tabs in the right places. At first it
# wouldn't run at all because I had some commas and
# parentheses in the wrong places. It's important to get
# familiar with the syntax of Shiny. I'm really glad we
# had to suffer through Problem Set 7 and figure out how
# Shiny works before launching into Mileston 8. Even so,
# there is still a learning curve with shiny. The coding
# here isn't as intuitive as tidyverse coding is, and it
# is so easy to mess something here and break your entire
# app.

ui <- fluidPage(
  navbarPage(
    "Growing Pains in Portland: A Story of Crime, Unemployment, and Population",
    tabPanel(
      "The Data",
      
      # tabsetPanel makes tabs within tabs. I referred to the
      # source code in other projects to see how this was done.
      # I also found a very helpful Shiny cheatsheet online
      # that I initially referred to heavily to make these tabs.
      
      tabsetPanel(
        tabPanel(
          "Victims in 2018",
          h3("Crime in 2018 by Victim Type"),
          br(),
          
          # I chose to go with sidebarPanel below so I would have my
          # graph on one side and a description to its side.
          
          sidebarPanel(
            selectInput(
              
              # This graph was originally rendering on multiple tabs.
              # That's because I had a comma in the wrong place.
              
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
          
          # Vertical layout didn't seem to change anything? I won't delete
          # this for future reference, but perhaps there is something else
          # I need to add here to make it work.
          
          verticalLayout(
            img(src = "crimeag15.png", style = "display: block; margin-left: auto; margin-right: auto;"),
            br(),
            br(),
            
            # It took me a bit to figure out how many breaks I needed and where
            # they should go, but I think I have a good system figured out it.
            
            img(src = "crimeag16.png", style = "display: block; margin-left: auto; margin-right: auto;"),
            
            # The code in "style = " above centers the image. I found it online
            # after unsuccessfully trying other things.
            
            br(),
            br(),
            img(src = "crimeag17.png", style = "display: block; margin-left: auto; margin-right: auto;"),
            
            # Because most of my graphs were rendered as static images, most
            # of my Shiny app code is the same thing copied and pasted. The only
            # thing that changes is what image is selected in each line of code.
            
            br(),
            br(),
            img(src = "crimeag18.png", style = "display: block; margin-left: auto; margin-right: auto;"),
            
            # I originally trying rendering the images by loading them into
            # the server and then calling them here, but they kept loading
            # on top of each other and were huge.
            
            br(),
            br(),
            
            # Bernadette showed me a way of loading images here in the ui
            # that doesn't require anything in the server, which is nice.
            
            img(src = "crimeag19.png", style = "display: block; margin-left: auto; margin-right: auto;"),
            
            # The trick is to remember to create a directory in the app
            # called "www" that contains all your images. You will have
            # to save them there after creating them in the Rmd using
            # the code I have provided. Even though they are kept in
            # this "www" directory, you don't mention that "www"
            # part here in the img(src = ... ). I don't know why it
            # works that way, it just does. Shiny is weird like that.
            
            br(),
            br()
          )
        ),
        tabPanel(
          "Crime Rate Over Time",
          h3("Person and Property Crime Rates Over Time, Plus Predictions for 2019 through 2023"),
          br(),
          
          # Lots of copy and paste! I'm not joking.
          
          img(src = "propplot.png", style = "display: block; margin-left: auto; margin-right: auto;"),
          br(),
          br(),
          img(src = "persplot.png", style = "display: block; margin-left: auto; margin-right: auto;"),
          br(),
          br(),
          img(src = "proppredplot.png", style = "display: block; margin-left: auto; margin-right: auto;"),
          br(),
          br()
        ),
        tabPanel(
          "Crimes Per Month",
          h3("Number of Reported Crimes Per Month from 2015 to 2019"),
          br(),
          img(src = "plotmonths15.png", style = "display: block; margin-left: auto; margin-right: auto;"),
          br(),
          br(),
          img(src = "plotmonths16.png", style = "display: block; margin-left: auto; margin-right: auto;"),
          br(),
          br(),
          img(src = "plotmonths17.png", style = "display: block; margin-left: auto; margin-right: auto;"),
          br(),
          br(),
          img(src = "plotmonths18.png", style = "display: block; margin-left: auto; margin-right: auto;"),
          br(),
          br(),
          img(src = "plotmonths19.png", style = "display: block; margin-left: auto; margin-right: auto;"),
          br(),
          br()
        ),
        tabPanel(
          "Population",
          h3("Population Growth Over Time and Predictions for 2019 through 2023"),
          br(),
          img(src = "popplot.png", style = "display: block; margin-left: auto; margin-right: auto;"),
          br(),
          br(),
          img(src = "popplot2.png", style = "display: block; margin-left: auto; margin-right: auto;"),
          br(),
          br(),
          img(src = "poppredplot.png", style = "display: block; margin-left: auto; margin-right: auto;"),
          br(),
          br(),
          img(src = "poppredplot2.png", style = "display: block; margin-left: auto; margin-right: auto;"),
          br(),
          br()
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

# The parentheses can get all messed up down here. I recommend
# frequently styling the active file to make sure they're
# all nice and pretty down here. It will also make the Shiny
# app more readable, which means it's easier to find errors.


server <- function(input, output) {
  output$victimbar <- renderPlot({
    
    # Despite its simple appearance, this ggplot rendered in Shiny
    # took me some time to figure out. Getting the exact code in
    # the inputs and outputs is a bit tricky, especially because
    # there are a couple parts in the ui that seem like they should
    # go here, but they don't. The only thing that goes down here
    # is the inputID, and then the output$victimbar goes above.
    
    crime18 %>%
      filter(CrimeAgainst == input$victim) %>%
      ggplot(aes(x = OffenseType, fill = OffenseType)) +
      geom_bar(show.legend = FALSE) +
      coord_flip() +
      scale_y_log10() +
      ylab("Count") +
      labs(title = "Display of Offense Type by Victim Type") +
      theme_minimal()
  })
  
  # Because I am rendering most of my graphs as static images
  # due to the fact that my data file are massive and it would
  # take forever to load (and sometimes it would just break),
  # I don't have a lot going on in the server. I might add more
  # graphics later and potentially add another interactive
  # graphic or two, but this is good for right now.
  
}

shinyApp(ui = ui, server = server)
