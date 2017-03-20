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



#  filtered <-
#    allOlympics %>%
#    filter(Athlete == formattedName)
#})



