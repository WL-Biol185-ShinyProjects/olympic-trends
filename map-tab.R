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

  
  # fluidPage(leafletOutput("mymap"),
  # p(),
  # actionButton("recalc", "New points")
#   box(background = "black", leafletOutput("Map", height = "400")),
# 
# box(title = "Controls", background = "black", status = "",
#     sliderInput("Dateslider", "Looping Animation:",
#                 min(allOlympics$Year),
#                 max(allOlympics$Year)
#     ))
# ))

# tabPanel("Map", leafletOutput("shinymap", height = 500, width = 950), position = "below")

# mapUI <- fluidPage(
#   leafletOutput("worldMap"),
#   p(),
#   actionButton("recalc", "New points")
# )

# mapUI <- fluidPage(
#   leafletOutput("mymap"),
#   p(),
#   h1("Added example to add more points here:"),
#   p(),
#   sliderInput("obs", "Number of observations:",
#               min = 1896, max = 2014, value = 1),
#   actionButton("recalc", "Show point")
  
# )

# mapUI <- fluidPage(
#   
#   map <- rgdal::readOGR("/home/gregg/countries.geo.json", "OGRGeoJSON"),
#   map@data$value <- runif(180, 0, 100),
#   
#   leafletOutput("myMap")
# )




