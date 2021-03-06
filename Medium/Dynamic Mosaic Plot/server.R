library(shiny)
library(productplots)

shinyServer(function(input, output) {
  
  output$mosaicplot <- renderPlot({
    
    # number of observations selected by user
    nob <- input$count
    
    # randomly select observations
    obs_selected <- sample(1:nrow(happy), nob)
    
    # which divider is selected by user
    # default divider is mosaic
    if(input$divider == "stacked") {
      
      if(input$relation == "marital") {
        
        prodplot(happy[obs_selected, ], ~ happy + marital, stacked())  
        
      }
      else {
        
        prodplot(happy[obs_selected, ], ~ happy + sex, stacked())  
        
      }
      
      
    } else {
      
      if(input$relation == "marital") {
        
        prodplot(happy[obs_selected, ], ~ happy + marital)  
        
      }
      else {
        
        prodplot(happy[obs_selected, ], ~ happy + sex)  
        
      }
      
    } 
    
  })
  
})