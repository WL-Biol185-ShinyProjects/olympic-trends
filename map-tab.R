library(shiny)
library(leaflet)


mapUI <- fluidPage(
  fluidRow(
    titlePanel("Olympic Medal Map"),
    p("This map represents the total number of medals won by countries participating 
      in the Olympics between 1896 and 2014. The darker the color of the country, 
      the more Olympic medals they have won over the years."),
    
    leafletOutput("medalMap", height = 500, width = 600)

  )
)
