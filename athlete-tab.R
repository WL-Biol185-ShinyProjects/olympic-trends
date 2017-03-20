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


#athleteTableUI <- fluidPage(
#  fluidRow(
#    allOlympics %>%
#      filter(Athlete == 'xxx') %>%
#      #summarise(athleteTable = )
#    dataTableOutput('table')
#  )
#)

athleteTableSrv <- renderDataTable(allOlympics)





