library(shiny)
library(leaflet)


mapUI <- fluidPage(
  fluidRow(
    titlePanel("Olympic Medal Map"),
    p("This map shows the number of medals won by countries participating 
      in the Olympics over the years. Click the button below the year 
      slider to begin animation."),
    
    leafletOutput("medalMap", height = 500, width = 950)

  )
)
