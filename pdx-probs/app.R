
# Load all your packages at the top and don't forget to load
# tidyverse last. I'm pretty sure I don't need scales here,
# but I included it just in case.

library(shiny)
library(readxl)
library(scales)
library(lubridate)
library(vembedr)
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
          "Get to know what's in this crime data. This interactive bar chart
          displays the three victim types that the Portland Police use to
          classify their cases. Within these victim types, you can see what
          sorts of crimes belong to which victim types--and how many of these
          types of crimes occurred in 2018.",
          br(),
          "As you can see, some crimes only occurred once in 2018, while others
          occurred thousands of times.",
          br(),
          br(),
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
          "While the numbers of crimes committed varies by year, the frequencies
          of broad kinds of crimes committed relative to one another remain
          fairly consistent across years. This gives a good sense of what
          crime in Portland generally looks like, year after year.",
          br(),
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
          "The Portland Police provide yearly crime rata data for two types of crimes:
          person crimes and property crimes. I wanted to display how these rates have
          changed in recent years. Because I saw an interesting linear trend in property
          crimes, I made a prediction for what the rate will be in 2019 through 2023.",
          br(),
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
          "I wanted to show that while there are broad consistencies year to
          year in criminal activity in Portland, each year is distinct. One
          thing I noticed while working in criminal defense is that some months
          seemed extraordinarily busy or slow for seemingly no reason. These
          graphs show how many crimes were reported per month in 2015 through
          2019. As you can see, it's not consistent. December often has far fewer
          crimes than other months.",
          br(),
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
          "Perhaps one of the most impactful phenomenon to occur in Portland has
          been how many people have moved to the city in recent years. Obviously
          this rate includes not just people moving there, but babies being born as
          well. Even so, you can see that Portland's population has been steadily
          climbing. I made two versions of a graph of population over time so
          you can see the population scaled (or not) on the y axis.",
          br(),
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
          br(),
          h3("Unemployment and Crime Rate Over Time"),
          br(),
          "Perhaps one of the most suprising things I found when exploring
          the data I had collected was the relationship between unemployment
          and crime rates for different types of crime.",
          br(),
          br(),
          "I had previously assumed there was likely a positive correlation
          between unemployment and crime. This data shows that there is in
          fact a negative relationship between unemployment and property crime
          and no clear relatiobship between unemlpoyment and person crime.",
          br(),
          br(),
          "I cannot conclude from this data that there is causation between
          unemployment and property crime. There could be an intervening
          variable that causes this; perhaps fewer property crimes get
          reported when the economy is doing poorly. In any case, it's
          an interesting relationsip.",
          br(),
          br(),
          "Each of the dots in the scatter plots below represent a single year.",
          br(),
          br(),
          img(src = "unempplot.png", style = "display: block; margin-left: auto; margin-right: auto;"),
          br(),
          br(),
          img(src = "unemppropcrime.png", style = "display: block; margin-left: auto; margin-right: auto;"),
          br(),
          br(),
          img(src = "table2.png", style = "display: block; margin-left: auto; margin-right: auto;"),
          br(),
          "This table displays the coefficients for the linear model I plotted
          that explores the relationship between unemployment and property
          crime. It displays the Unemmployment coefficent as a slope of -0.935,
          meaning that for every percentage point increase in Unemployment, we
          should expect a decrease in property crime rate of 0.935. This table
          also shows the standard error, T statistic, and P value for my linear
          regression.",
          br(),
          img(src = "unempperscrime.png", style = "display: block; margin-left: auto; margin-right: auto;"),

          # Don't forget the .png suffices here or your images won't
          # load!

          br(),
          br()
        )
      )
    ),
    tabPanel(
      "About",
      h3("Growing Pains in Portland: A Story of Crime, Unemployment, and Population"),
      br(),
      h4("Understanding how changes in population and unemployment may affect crime rates in
         Portland, Oregon."),
      br(),
      "I am interested in examing the relationship between population growth, crime rates,
      and unemployment rates in Portland, Oregon. The city has undergone some of the most
      rapid changes of any U.S. city in recent years and has quickly become a favored
      destination for young people in particular. I am a Portland native and have noticed
      how much the city has visibly changed in recent years. Neighborhoods that were once
      avoided due to concerns about safety are now the trendiest shopping and dining districts
      in the city. I hope to better understand how changes in the economy and composition
      of the city may have impacted what kinds of crimes are commited and at what rates.",
      br(),
      br(),
      embed_url("https://youtu.be/Ci3je2WeC-s") %>%
        div(align = "center"),
      br(),
      br(),
      h4("About the Data"),
      br(),
      "I am using yearly crime data files from the",

      # It took a couple tries to get this hyperlink code right. I found
      # the base of the code from another project. The trick is to put
      # in the http://www. part of the url, otherwise the app tries
      # to find the file in a local directory.

      a("Portland Police Bureau", href = "https://www.portlandoregon.gov/police/71978"),
      "as well as their",
      a("crime rate estimates", href = "https://www.portlandoregon.gov/police/article/739634"),
      "current as of August 12, 2019.",
      br(),
      br(),
      "I am also using population estimates from the",
      a("U.S. Census.", href = "https://factfinder.census.gov/faces/nav/jsf/pages/index.xhtml"),
      br(),
      br(),
      "Lastly, I am using unemployment rate data from the",

      # I'm not really sure what to do about this ridiculously long hyperlink.
      # I tried breaking it up into chunks and it broke the link in the app.

      a("U.S. Bureau of Labor Statistics.", href = "https://data.bls.gov/timeseries/LAUMT413890000000003?amp%253bdata_tool=XGtable&output_view=data&include_graphs=truehttps://data.bls.gov/pdq/SurveyOutputServlet"),
      br(),
      br(),
      h4("About Me"),
      br(),
      "My name is Sophia Freuden. I am a first-year graduate student in Harvard
      University's master's program for Regional Studies: Russia, Eastern
      Europe, and Central Asia. Prior to starting my graduate studies, I worked
      in criminal defense in Portland, Oregon and haven taken an interest in
      how rapidly the city has changed in recent years--and what that means for
      residents.",
      br(),
      br(),
      "You can follow me on Twitter",
      a("here.", href = "http://www.twitter.com/sophiafreuden"),
      br(),
      br(),
      "You can also find me on LinkedIn",
      a("here.", href = "https://www.linkedin.com/in/sophiafreuden"),
      br(),
      br(),
      h4("GitHub Repository"),
      br(),
      "You can find my public GitHub repo for this project",
      a("here.", href = "https://github.com/sophiafreuden/pdx-probs"),
      br(),
      br()
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

    # Per Georgie's suggestion, I reordered the bars in this
    # interactive graph. I knew how to do it because I had already
    # reordered all the bars in my crimeagimg.Rmd, but I had to
    # type all these crime names in by hand. I made typos in only
    # two of them. It was actually nice; instead of totally breaking
    # my app, the two columns just showed up with a "NA" name, but
    # they retained their original count. That way I could easily
    # identify which name I had made a typo in and fix it.

    crime18$OffenseType <- factor(crime18$OffenseType,
      levels = c(
        "Theft From Motor Vehicle",
        "All Other Larceny",
        "Motor Vehicle Theft",
        "Vandalism",
        "Burglary",
        "Shoplifting",
        "Identity Theft",
        "Theft From Building",
        "False Pretenses/Swindle/Confidence Game",
        "Theft of Motor Vehicle Parts or Accessories",
        "Robbery",
        "Counterfeiting/Forgery",
        "Credit Card/ATM Fraud",
        "Arson",
        "Embezzlement",
        "Purse-Snatching",
        "Pocket-Picking",
        "Hacking/Computer Invasion",
        "Stolen Property Offenses",
        "Impersonation",
        "Theft From Coin-Operated Machine or Device",
        "Extortion/Blackmail",
        "Wire Fraud",
        "Bribery",
        "Welfare Fraud",
        "Simple Assault",
        "Aggravated Assault",
        "Intimidation",
        "Rape",
        "Fondling",
        "Sodomy",
        "Kidnapping/Abduction",
        "Sexual Assault With An Object",
        "Murder and Non-negligent Manslaughter",
        "Statutory Rape",
        "Commercial Sex Acts",
        "Involuntary Servitude",
        "Incest",
        "Drug/Narcotic Violations",
        "Weapons Law Violations",
        "Purchasing Prostitution",
        "Prostitution",
        "Pornography/Obscene Material",
        "Animal Cruelty",
        "Assisting or Promoting Prostitution",
        "Drug Equipment Violations",
        "Operating/Promoting/Assisting Gambling"
      )
    )

    crime18 %>%
      filter(CrimeAgainst == input$victim) %>%
      ggplot(aes(x = OffenseType, fill = OffenseType)) +
      geom_bar(show.legend = FALSE) +
      coord_flip() +
      scale_y_log10(label = comma) +

      # I wanted to add commas to the numbers in this graph
      # and originally tried by adding scale_y_continous
      # with a label argument fed into it, but I forgot
      # I had already scaled the y axis on log10. That
      # made it look all weird--I'm honestly surprised it
      # didn't totally break my code. I then moved the
      # label argument into scale_y_log10.

      ylab("Count") +
      labs(
        title = "Display of Offense Type by Victim Type",

        # I tried breaking the second line of the caption below
        # here in Shiny, but if I did that, it made my graphic
        # look weird.

        caption = "Scaled on x axis.
                  Offense types with no color showing indicate a single instance of that offense type."
      ) +
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

# And that's it! I estimate that this app combined with all of the
# Rmd and R script files total over 1,700 lines of code.
