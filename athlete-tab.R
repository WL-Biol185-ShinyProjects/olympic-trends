library(shiny)

athleteNameUI <- fluidPage(
  selectInput('athleteName', 
              'Start typing athlete name...', 
              unique(allOlympics$Athlete),
              selectize = TRUE
  ),
  dataTableOutput('athleteHistory')
  
)

# athleteHandler <- function(input) {
#   
#   renderDataTable({
#     
#     allOlympics %>%
#       filter(Athlete == input$athleteName)
#     
#   })
#   
# }

# athleteNameSrv <- renderPrint(input$athleteName)


#athleteTableUI <- fluidPage(
#  fluidRow(
#    allOlympics %>%
#      filter(Athlete == 'xxx') %>%
#      #summarise(athleteTable = )
#    dataTableOutput('table')
#  )
#)

#athleteTableSrv <- renderDataTable(allOlympics)





