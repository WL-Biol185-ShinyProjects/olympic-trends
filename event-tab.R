library(shiny)
library(dplyr)
library(ggplot2)

eventTabUI <- fluidPage(
  titlePanel("Event Winners"),
   fluidRow(
     selectizeInput("season", "Season:",
                    c("All", unique(allOlympics$Season))),
     selectizeInput("gender", "Gender:",
                    c("All", unique(allOlympics$Gender))),
     uiOutput("yearUI"),
     uiOutput("seasonGenderUI"),
     uiOutput("disciplineUI"),
     uiOutput("sportUI"),
     # uiOutput("disciplineUI"),
     uiOutput("eventUI"),
     
     dataTableOutput('eventTable')
   )
)
