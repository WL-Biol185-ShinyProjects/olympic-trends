library(shiny)
source("global.R")

athleteNameUI <- fluidPage(
  fluidRow(
    titlePanel("Athlete History"),
    p("This tool allows you to track Olympic medals won by individual athletes. 
      Start by typing any Olympic athlete's name."),
    selectInput('athleteName', label = "Athlete Name", choices = unique(allOlympics$Athlete), 
                selectize = TRUE
    ),
    
    dataTableOutput('athleteHistory')
  )
)


