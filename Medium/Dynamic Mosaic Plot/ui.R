library(shiny)
library(productplots)

shinyUI(fluidPage(
  
  # application title
  titlePanel("Dynamic Mosaic Plot"),
  
  sidebarLayout(
    
    # sidebar with options for controlling parameters
    sidebarPanel(
      
      # for changing number of observations
      sliderInput("count",
                  "Number of observations:",
                  min = 1,
                  max = nrow(happy),
                  value = nrow(happy)/3),
      
      # for selecting type of divider
      radioButtons("divider", "Select Divider:", 
                   c("Mosaic" = "mosaic",
                     "Stacked" = "stacked" )),
      
      # relationship between different categorical variables
      radioButtons("relation", "Change Category:", 
                   c("Marital" = "marital",
                     "Sex" = "sex" ))
      
    ),
    
    # plotting 
    mainPanel(
      plotOutput("mosaicplot")
    )
  )
))