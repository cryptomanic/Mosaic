library(shiny)
library(productplots)

shinyServer(function(input, output) {
  
  output$mosaicplot <- renderPlot({
    
    # number of observations selected by user
    nob <- input$count
    
    # which divider is selected by user
    # default divider is mosaic
    if(input$divider == "stacked") {
      
      prodplot(happy[1:nob, ], ~ happy + sex, stacked())
      
    } else {
      
      prodplot(happy[1:nob, ], ~ happy + sex)
      
    } 
    
  })
  
  
  
})