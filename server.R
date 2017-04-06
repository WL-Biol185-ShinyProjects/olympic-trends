library(shiny)
library(shinydashboard)
library(ggplot2)
library(dplyr)
library(plyr)
library(rjson)
library(reshape2)
library(RColorBrewer)
library(leaflet)
source("global.R")

function(input, output){
  
##########Athlete Tab
  output$athleteHistory <- renderDataTable({
    
    allOlympics %>%
      filter(Athlete == input$athleteName) %>%
      transmute(Country, Year, City, Discipline, Event, Medal)
    
  })
    
##########Event Tab
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
    
    # if (is.null(input$season) || is.null(input$gender) || is.null(input$sport)) {
    #   return()
    # }

    disciplineOptions <- allOlympics %>%
      filter(Season == input$season) %>%
      filter(Gender == input$gender) %>%
      filter(Sport == input$sport)
    
    selectizeInput("disc", "Discipline:", 
                   unique(disciplineOptions$Discipline)
    )

  })
  
  output$eventUI <- renderUI({

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

    allOlympics %>%
      filter(Season == input$season) %>%
      filter(Gender == input$gender) %>%
      filter(Sport == input$sport) %>%
      filter(Discipline == input$disc) %>%
      filter(Event == input$event) %>%
      filter(Year == input$yr) %>%
      transmute(Medal, Country, Athlete)

  })

##########Trends Tab
  output$trendsPlot <- renderPlot({

    plotData <- allOlympics %>%
      filter(Year > input$year[1], Year < input$year[2]) %>%
      filter(Country == input$country) %>%
      filter(Discipline == input$discipline) %>%
      group_by(Year) %>%
      summarise(n = n())

    plotData %>%
      ggplot(aes(Year, n), size = 10) +
      geom_point() +
      # theme(plot.background=element_rect(fill='gold')) +
      # ggtitle("Medal Trends Over Time") +
      labs(x = "Year", y = "Number of Medals")

    # + aes_string(color = input$sortBy)

    })
  
  output$downloadTrendsPlot <- downloadHandler(
    content = function(file) {
      png(file)
      device <- function(..., width, height) {
        grDevices::png(..., width = width, height = height, res = 300, units = "in")
      }
      ggsave(file, plot = "trendsPlot", device = device)

    })

  ################think we can delete this  
  # points <- eventReactive(input$recalc, {
  #   cbind(rnorm(40) * 2 + 13, rnorm(40) + 48)
  # }, ignoreNULL = FALSE)
  # 
  # filteredData <- reactive({
  #   allOlympics[allOlympics$Medal >= input$range[1] & allOlympics$Medal <= input$range[2],]
  # })
 
  output$medalMap <-renderLeaflet({
    
    mymap <- rgdal :: readOGR("countries.geo.json", "OGRGeoJSON")
    
    medalData <-allOlympics %>%
      group_by(Country) %>%
      summarise("n" = n())
    
    ######merging map and olympic data 
    countryMap <- left_join(medalData,countryjsonsame1, by=c("Country" = "name"))
    newTable <- left_join(mymap@data,countryMap, by= c("name" = "name"))
    mymap@data <- newTable
    
    pal <- colorBin("YlOrRd", domain = mymap$n, bins = bins)
  
    
    leaflet(data = mymap) %>%
      addTiles(options= tileOptions(noWrap=TRUE)) %>%
      addPolygons(
        fillColor = ~pal(n),
        weight = 2,
        opacity = 1,
        color = "white",
        dashArray = "3",
        fillOpacity = 0.7)
  })
  
}

  
