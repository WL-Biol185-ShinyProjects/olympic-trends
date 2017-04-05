library(shiny)
source("global.R")

eventTabUI <- fluidPage(
  fluidRow(
    titlePanel("Event Winners"),
    p("This tool allows you to search for medal winners of specific Olympic events. 
      Start by selecting season and continue with following choice boxes."), 
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
