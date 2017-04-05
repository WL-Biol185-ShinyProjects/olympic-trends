library(shiny)
source("global.R")

eventTabUI <- fluidPage(
  titlePanel("Event Winners"),
   fluidRow(
     selectizeInput("season", "Season:", 
                    unique(allOlympics$Season)
     ),
     selectizeInput("gender", "Gender:", 
                    unique(allOlympics$Gender)
     ),
     uiOutput("sportUI"),
     uiOutput("disciplineUI"),
     uiOutput("eventUI"), 
     uiOutput("yearUI"),

     dataTableOutput('eventTable')
     
   )
)
