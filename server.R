library(shiny)
library(shinydashboard)
library(ggplot2)
library(leaflet)

function(input, output, session) {
  
  output$athleteHistory <- renderDataTable({
    
    allOlympics %>%
      filter(Athlete == input$athleteName) %>%
      transmute(Year, City, Discipline, Country, Event, Medal)
    
  })
    
  output$sportUI <- renderUI({
    
    sportOptions <- allOlympics %>%
      filter(Season == input$season) %>%
      filter(Gender == input$gender)
    
    selectizeInput("sport", "Sport:",
                   c("All", unique(sportOptions$Sport))
    )
    
  })
  
  output$disciplineUI <- renderUI({
    
    disciplineOptions <- allOlympics %>%
      filter(Season == input$season) %>%
      filter(Gender == input$gender) %>%
      filter(Sport == input$sport)
    
    selectizeInput("discipline", "Discipline:", 
                   c("All", unique(disciplineOptions$Discipline))
    )
    
  })
  
  output$eventUI <- renderUI({
    
    eventOptions <- allOlympics %>%
      filter(Season == input$season) %>%
      filter(Gender == input$gender) %>%
      filter(Sport == input$sport) %>%
      filter(Discipline == input$discipline)
    
    selectizeInput("event", "Event:", 
                   c("All", unique(eventOptions$Event))
    )
    
  })
  
  output$yearUI <- renderUI({
    
    yearOptions <- allOlympics %>%
      filter(Season == input$season) %>%
      filter(Gender == input$gender) %>%
      filter(Sport == input$sport) %>%
      filter(Discipline == input$discipline) %>%
      filter(Event == input$event)
    
    selectizeInput("year", "Year:", 
                   c("All", unique(yearOptions$Year))
    )
    
  })
  
  output$eventTable <- renderDataTable({
    
    allOlympics %>%
      filter(Season == input$season) %>%
      filter(Gender == input$gender) %>%
      filter(Sport == input$sport) %>%
      filter(Discipline == input$discipline) %>%
      filter(Event == input$event) %>%
      filter(Year == input$year) %>%
      transmute(City, Athlete, Country, Medal)
    
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
  
  output$trendsPlot <- renderPlot({
    
    allOlympics %>%
      filter(input$year[1] > Year, input$year[2] < Year) %>%
      filter(Country == input$country) %>%
      filter(Discipline == input$discipline) %>%
      summarise(n = n())
      ggplot(aes(Year, n)) + aes_string(color = input$sortBy) + geom_point()
    
    })

  # points <- eventReactive(input$recalc, {
  #   cbind(rnorm(40) * 2 + 13, rnorm(40) + 48)
  # }, ignoreNULL = FALSE)
  # 
  # output$mymap <- renderLeaflet({
  #   leaflet() %>%
  #     addProviderTiles(providers$Stamen.TonerLite,
  #                      options = providerTileOptions(noWrap = TRUE)
  #     ) %>%
  #     addMarkers(data = points())
  # })
  points <- eventReactive(input$recalc, {
    cbind(input$year)
  }, ignoreNULL = FALSE)
  
  output$mymap <- renderLeaflet({
    leaflet() %>%
      allOlympics %>%
      filter(Year == input$obs)
      addProviderTiles("Stamen.TonerLite",
                       options = providerTileOptions(noWrap = TRUE)
      ) %>%
      addMarkers(data = density())
  })
}

  
