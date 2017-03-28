library(shiny)

athleteNameUI <- fluidPage(
  titlePanel("Athlete History"),
  selectInput('athleteName', 
              'Start typing athlete name...', 
              unique(allOlympics$Athlete),
              selectize = TRUE
  ),
  
  dataTableOutput('athleteHistory')
  
)


