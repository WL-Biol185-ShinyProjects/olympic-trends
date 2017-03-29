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
  
  observe({
    isolate ({updateSelectizeInput(session, "season", 
                        choices = c(unique(allOlympics$Season)))
      })
    isolate ({
      updateSelectizeInput(session, "gender", 
                        choices = c(unique(allOlympics$Gender)))
    })
    isolate ({
      updateSelectizeInput(session, "year",
                        choices = c(unique(allOlympics$Year)))
    })
    isolate ({
      updateSelectizeInput(session, "sport",
                        choices = c(unique(allOlympics$Sport)))
    })
    isolate ({
      updateSelectizeInput(session, "dicipline",
                        choices = c(unique(allOlympics$Discipline)))
    })
    isolate ({
      updateSelectizeInput(session, "event",
                        choices = c(unique(allOlympics$Event)))
    })
  })
  
  output$eventTable <- renderDataTable({
    allOlympics %>%
    filter(Season == input$season) %>%
    filter(Gender == input$gender) %>%
    filter(Year == input$year) %>%
    filter(Sport == input$sport) %>%
    filter(Discipline == input$discipline) %>%
    filter(Event == input$event) %>%
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
      ggplot(aes(Year, n, color = 'sortBy')) + geom_bar(stat = 'identity')
    
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



  
