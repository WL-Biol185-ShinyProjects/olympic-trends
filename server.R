library(shiny)
library(shinydashboard)
library(ggplot2)


function(input, output, session) {
  output$athleteHistory <- renderDataTable({
    
    allOlympics %>%
      filter(Athlete == input$athleteName)
  })
  
  observe({
    
    isolate ({updateSelectInput(session, "season", 
                        choices = c(unique(as.character(allOlympics$Season))))
      })
    isolate ({
      updateSelectInput(session, "gender", 
                        choices = c(unique(as.character(allOlympics$Gender))))
    })
    isolate ({
      updateSelectInput(session, "year",
                        choices = c(unique(as.character(allOlympics$Year))))
    })
    isolate ({
      updateSelectInput(session, "sport",
                        choices = c(unique(as.character(allOlympics$Sport))))
    })
    isolate ({
      updateSelectInput(session, "dicipline",
                        choices = c(unique(as.character(allOlympics$Discipline))))
    })
    isolate ({
      updateSelectInput(session, "event",
                        choices = c(unique(as.character(allOlympics$Event))))
    })
  })
  output$eventTable <- renderDataTable({
    allOlympics %>%
    filter(Season == input$season) %>%
    filter(Gender == input$gender) %>%
    filter(Year == input$year) %>%
    filter(Sport == input$sport) %>%
    filter(Discipline == input$discipline) %>%
    filter(Event == input$event)
 
  })

  trends <- observe({
    minyear <- input$year[1]
    maxyear <- input$year[2]
    country <- input$country
    discipline <- input$discipline
    
    t <- allOlympics %>%
    filter(
      Year >= minyear,
      Year <= maxyear)
  
      })
 output$eventTable <- renderDataTable({

  }) 
output$trendsPlot <- renderPlot({
    
    allOlympics %>%
      filter(input$year[1] > Year, input$year[2] < Year) %>%
      filter(input$country == Country) %>%
      filter(input$discipline == Discipline) %>%
      ggplot(aes(x = Year, y = Medal, color = 'red')) +
      geom_point()
    
  })
}

  




