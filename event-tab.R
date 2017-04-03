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
<<<<<<< HEAD
     uiOutput("yearUI"),
     uiOutput("seasonGenderUI"),
     uiOutput("disciplineUI"),
=======
     uiOutput("sportUI"),
     # uiOutput("disciplineUI"),
>>>>>>> beff01c215f3e6360232bee8e96899ce19c15045
     uiOutput("eventUI"),
     
     dataTableOutput('eventTable')
   )
)
