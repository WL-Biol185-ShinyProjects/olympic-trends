library(shiny)

athleteNameUI <- fluidPage(
  selectInput('athleteName', 
              'Start typing athlete name...', 
              unique(allOlympics$Athlete),
              selectize = TRUE
  ),
  verbatimTextOutput("outName")
)

athleteNameSrv <- renderPrint(input$athleteName)


athleteTableUI <- fluidPage(
  fluidRow(
    dataTableOutput('table')
  )
)

athleteTableSrv <- renderDataTable(allOlympics)



athleteTable <- renderDataTable(
  allOlympics %>%
    filter(Athlete == outName)
)



<<<<<<< HEAD
=======
#  filtered <-
#    allOlympics %>%
#    filter(Athlete == formattedName)
#})



>>>>>>> 5d9d9e62fbd4c2c244997fedfe96b7a9d9d35cc1
