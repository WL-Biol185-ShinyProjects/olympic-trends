library(shiny)
library(shinydashboard)
library(ggplot2)


function(input, output, session) {
  output$athleteHistory <- renderDataTable({
    
    allOlympics %>%
      filter(Athlete == input$athleteName)
    
  })
  
  
  observe ({
    
    event <- allOlympics %>%
      filter(Season == input$season) %>%
      filter(Gender == input$gender) %>%
      filter(Year == input$year) %>%
      filter(Sport == input$sport) %>%
      filter(Discipline == input$discipline) %>%
      filter(Event == input$event)
   
    updateSelectInput(session, "season", choices = c(unique(as.character(allOlympics$Season))))
    updateSelectInput(session, "gender", choice = c(unique(as.character(allOlympics$Gender))))
    updateSelectInput(session, "year", choices = c(unique(as.character(allOlympics$Year))))
    updateSelectInput(session, "sport", choice = c(unique(as.character(allOlympics$Sport))))
    updateSelectInput(session, "discipline", choices = c(unique(as.character(allOlympics$Discipline))))
    updateSelectInput(session, "event", choice = c(unique(as.character(allOlympics$Event))))
    
  })
  
  output$eventTable <- renderDataTable({
    
    event 
    
  })
  
  output$trendsPlot <- renderPlot({
    
    allOlympics %>%
      filter(input$year[1] > Year, input$year[2] < Year) %>%
      filter(input$country == Country) %>%
      filter(input$discipline == Discipline) %>%
      ggplot(aes(x = Year, y = count, color = input$sortBy)) +
      geom_point()
    
  })
    
}

