library(shiny)
library(leaflet)

# mapUI <- fluidPage(
#   leafletOutput("worldMap"),
#   p(),
#   actionButton("recalc", "New points")
# )

mapUI <- fluidPage(
  leafletOutput("mymap"),
  p(),
  h1("Added example to add more points here:"),
  p(),
  sliderInput("obs", "Number of observations:",
              min = 1896, max = 2014, value = 1),
  actionButton("recalc", "Show point")
  
)