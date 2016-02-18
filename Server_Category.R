library(shiny)

shinyServer(function(input, output,session) {
  source('D:/UTDallasStudy/RWorkingDirectory/bigData-project/yelpfunctions.R')
  initializeData()
  datasetInput <- reactive({
      print(input$category)
      x <-process(input$category)
  })
    
  # Show the first "n" observations
  output$view <- renderTable({
    datasetInput()[]
  })
  
  output$myImage <- renderImage({
    # Return a list containing the filename
    
    getImage(datasetInput()[])
    
    list(src = "one.png",
         contentType = 'image/png',
         width = 600,
         height = 300)
  })
})
