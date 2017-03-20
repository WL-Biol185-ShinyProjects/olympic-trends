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

#EventSrv <- function(input, output) 
#  output$table <- DT:renderDataTable((DT::datatable{data <- allOlympics
#  if (input$Season != "All") {
 #   data <- data[data$Season == inout$season,]
  #}
#  if (input&gender !="All" {
#    data <- data[data$gender == input$gender,]
#  }
#    data
#  )
#}

EventUI <- fluidPage(
  titlePanel("xxx"),
  fluidRow(
    column(4,
           selectInput("Season","Season:",
                       c("All",
                         unique(as.character(allOlympics$Season)
                             )))
  ),
  column(4,
         selectInput("Gender",
                     "Gender:",
                     c("All",
                       unique(as.character(allOlympics$Gender)
                              )))
  )))
  



