library(shiny)
library(shinydashboard)
library(ggplot2)
library(dplyr)
library(leaflet)
source("global.R")

function(input, output){
  
#############Athlete Tab#############
  output$athleteHistory <- renderDataTable({
    
    allOlympics %>%
      filter(Athlete == input$athleteName) %>%
      transmute(Country, Year, City, Discipline, Event, Medal)
    
  })
  
#############Event Tab  #############
  output$sportUI <- renderUI({
    
    if (is.null(input$season) || is.null(input$gender)) {
      return()
    }

    sportOptions <- allOlympics %>%
      filter(Season == input$season) %>%
      filter(Gender == input$gender)
    
    selectizeInput("sport", "Sport:", 
                   unique(sportOptions$Sport)
    )
    
  })
  
  output$disciplineUI <- renderUI({
    
    if (is.null(input$season) || 
        is.null(input$gender) || 
        is.null(input$sport)
    ){
      return()
    }
    
    disciplineOptions <- allOlympics %>%
      filter(Season == input$season) %>%
      filter(Gender == input$gender) %>%
      filter(Sport == input$sport)
    
    selectizeInput("disc", "Discipline:", 
                   unique(disciplineOptions$Discipline)
    )
    
  })
  
  output$eventUI <- renderUI({
    
    if (is.null(input$season) || 
        is.null(input$gender) || 
        is.null(input$sport) ||
        is.null(input$disc)
    ){
      return()
    }
    
    eventOptions <- allOlympics %>%
      filter(Season == input$season) %>%
      filter(Gender == input$gender) %>%
      filter(Sport == input$sport) %>%
      filter(Discipline == input$disc)
    
    selectizeInput("event", "Event:", 
                   unique(eventOptions$Event)
    )
    
  })
  
  output$yearUI <- renderUI({
    
    if (is.null(input$season) || 
        is.null(input$gender) || 
        is.null(input$sport) ||
        is.null(input$disc) ||
        is.null(input$event)
    ){
      return()
    }
    
    yearOptions <- allOlympics %>%
      filter(Season == input$season) %>%
      filter(Gender == input$gender) %>%
      filter(Sport == input$sport) %>%
      filter(Discipline == input$disc) %>%
      filter(Event == input$event)
    
    selectizeInput("yr", "Year:",
                   unique(yearOptions$Year)
    )
    
  })
  
  output$eventTable <- renderDataTable({
    
    if (is.null(input$season) ||
        is.null(input$gender) ||
        is.null(input$sport) ||
        is.null(input$disc) ||
        is.null(input$event) ||
        is.null(input$yr)
    ){
      return()
    }
    
    allOlympics %>%
      filter(Season == input$season) %>%
      filter(Gender == input$gender) %>%
      filter(Sport == input$sport) %>%
      filter(Discipline == input$disc) %>%
      filter(Event == input$event) %>%
      filter(Year == input$yr) %>%
      transmute(Medal, Country, Athlete)
    
  })
  
#############Trends Tab#############
  output$trendsPlot <- renderPlot({
    
    plotData <- allOlympics %>%
      filter(Year > input$year[1], Year < input$year[2]) %>%
      filter(Country == input$country) %>%
      filter(Discipline == input$discipline) %>%
      group_by(Year) %>%
      summarise(n = n())
    
    plotData %>%
      ggplot(aes(Year, n), size = 10) +
      geom_point(color = "goldenrod2") +
      labs(x = "Year", y = "Number of Medals", title = "Medal Trends Over Time") +
      fte_theme() +
      theme(plot.title = element_text(size = 20, face = "bold", margin = margin(10, 0, 10, 0))) +
      geom_hline(yintercept = 0, size = 0.4, color = "black") +
      geom_vline(xintercept = input$year[1], size = 0.4, color = "black")
      
  })

  output$downloadTrendsPlot <- downloadHandler(
    filename = function() { 
      paste(input$trendsPlot, '.png', sep='') 
    },
    content = function(file) {
      ggsave(file)
    }
  )
  
#############Map Tab#############
  output$medalMap <- renderLeaflet({
    
    map <- rgdal::readOGR("/home/gregg/countries.geo.json", "OGRGeoJSON")
    
    medalData <- allOlympics %>%
      group_by(Country) %>%
      summarise(q = n())
    
    #############Merge Map and Olympic Data#############
    countryMap <- left_join(medalData, countryAbrv, by = c("Country" = "Country") )
    medalMapData <- left_join(map@data, countryMap, b = c("name" = "name"))
    map@data <- medalMapData
    
    pal <- colorBin("YlOrRd", domain = map$q)
    
    leaflet(data = map) %>%
      addTiles() %>%
      addPolygons(
        fillColor = ~pal(q), 
        weight = 2, 
        opacity = 1, 
        color = "white", 
        dashArray = "3", 
        fillOpacity = 0.7
      )
    
  })
}
