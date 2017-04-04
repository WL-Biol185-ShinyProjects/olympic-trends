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
<<<<<<< HEAD
     # uiOutput("disciplineUI"),
     uiOutput("eventUI"),
=======
     uiOutput("disciplineUI"),
     uiOutput("eventUI"), 
>>>>>>> 99c3ec2943276097f2da9673ffeea6239a315502
     
     dataTableOutput('eventTable')
     
   )
)
