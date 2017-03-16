library(shiny)

seasonUI <- fluidPage(
  selectInput("season", label = h3("Select Season"),
              choices = list("Summer" = summer, "Winter" = winter), 
              selected = 1),  
  hr(),
  fluidRow(column(3, verbatimTextOutput("value")))
)
