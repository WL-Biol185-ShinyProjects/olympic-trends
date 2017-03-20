library(shiny)
library(dplyr)

seasonUI <- fluidPage(
  selectInput('season', 
              'Select Season',
              unique(allOlympics$Season)
  )
)

seasonSrv <- renderPrint(input$season)

#genderUI <- fluidPage(
#  selectInput('gender', 
#              'Select Gender',
#              unique(allOlympics$Gender)
#  )
#)

#genderSrv <- renderPrint(input$gender)
