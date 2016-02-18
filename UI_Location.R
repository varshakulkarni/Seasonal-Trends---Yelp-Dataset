library(shiny)

shinyUI(fluidPage(
  titlePanel("Yelp Dataset Challenge"),
  sidebarLayout(
    sidebarPanel(
      h2("Business Details"),
      p("Here, details about the business are given."),
      br(),
      textInput("city", "city", "Las Vegas"),      
      helpText("Note: while the data view will show only the specified",
               "number of observations, the summary will still be based",
               "on the full dataset."),
      
      submitButton("Update View")
    ),
    mainPanel(
      
      tabsetPanel(type = "tabs",
                  
                  tabPanel("Seasonal Trend By Location", h1("Seasonal Trend By Location"),p("Seasonal Trend By Location (Spring, Summer, Fall and Winter)"),imageOutput("myImage")),
                  tabPanel("Table", h1("Observations"),tableOutput("view"))
                  
      )
      
      #h1("WordCloud"),
      #p("Word Cloud contains all the nouns in user tips"),
      #imageOutput("myImage"),
      #h1("Observations"),
      #tableOutput("view")
    )
  )
))
