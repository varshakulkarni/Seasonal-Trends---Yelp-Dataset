library(shiny)

shinyUI(fluidPage(
  titlePanel("Yelp Dataset Challenge"),
  sidebarLayout(
    sidebarPanel(
      h2("Business Details"),
      p("Here, details about the business are given."),
      br(),
      textInput("category", "Category", "restaurants"),      
      helpText("Note: while the data view will show only the specified",
               "number of observations, the summary will still be based",
               "on the full dataset."),
      
      submitButton("Update View")
    ),
    mainPanel(
      
      tabsetPanel(type = "tabs",
                  
                  tabPanel("Seasonal Trend By Category", h1("Seasonal Trend By Category"),p("Seasonal Trend By Category (Spring, Summer, Fall and Winter)"),imageOutput("myImage")),
                  tabPanel("Table", h1("Observations"),tableOutput("view"))
                  
      )
    )
  )
))
  
  output$myImage <- renderImage({
    # Return a list containing the filename
    
    getImage(datasetInput()[])
    
    list(src = "one.png",
         contentType = 'image/png',
         width = 600,
         height = 300)
  })
})
