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



<<<<<<< HEAD
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

=======
>>>>>>> 2330d40399f4a89981d22b3a81f30feba5acff4f


>>>>>>> 5d9d9e62fbd4c2c244997fedfe96b7a9d9d35cc1
