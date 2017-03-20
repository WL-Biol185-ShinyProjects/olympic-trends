library(shiny)
library(shinydashboard)


function(input, output, session) {
  output$athleteHistory <- renderDataTable({
    
    allOlympics %>%
      filter(Athlete == input$athleteName)
    
  })
  
  output$eventTable <- renderDataTable({
    data <- allOlympics
    if (input$season != "All") {
      data <- data[data$Season == input$season,]
    }
    if (input$gender != "All") {
      data <- data[data$Gender == input$gender,]
    }
    if (input$year != "All") {
      data <- data[data$Year == input$year,]
    }
    if (input$sport != "All") {
      data <- data[data$Sport == input$sport,]
    }
    if (input$discipline != "All") {
      data <- data[data$Discipline == input$discipline,]
    }
    if (input$event != "All") {
      data <- data[data$Event == input$event,]
    }
  })
}

