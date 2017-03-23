library(shiny)
library(shinydashboard)
library(ggplot2)


function(input, output, session) {
  
  output$athleteHistory <- renderDataTable({
    
    allOlympics %>%
      filter(Athlete == input$athleteName)
  })
  
   observe({
     isolate ({
       updateSelectInput(session, "season", 
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
 
<<<<<<< HEAD
  # reactive({
  #  EventTab <-allOlympics %>%
  #   filter(Season == input$season) %>%
  #   filter(Gender == input$gender) %>%
  #   filter(Year == input$year) %>%
  #   filter(Sport == input$sport) %>%
  #   filter(Discipline == input$discipline) %>%
  #   filter(Event == input$event)
  # })
  seasonDD <- reactive({
    allOlympics %>%
      filter(Season == reactiveValues()$season)
  })
  genderDD <- reactive({
    seasonDD %>%
      filter(Gender == reactiveValues()$season,seasonDD == TRUE)
  })
  yearDD <- reactive({
    genderDD %>%
      filter(Year == reactiveValues()$gender, genderDD == TRUE)
  })
  sportDD <- reactive({
    yearDD %>%
      filter(Sport == reactiveValues()$year, yearDD == TRUE)
  })
  disciplineDD <- reactive({
    sportDD %>%
      filter(Discipline == reactiveValues()$sport, sportDD == TRUE)
  })
  eventDD <- reactive({
    disciplineDD %>%
      filter(Event == reactiveValues()$discipline, disciplineDD == TRUE)
  })
  # 
#   reactive({
#   updateSelectInput(session, "season", choices = c(unique(as.character(allOlympics$Season))))
#     availableSeason <- allOlympics[allOlympics$Season == input$season, "gender"]
#   updateSelectInput(session, "gender", choices = c(unique(as.character(availableSeason), selected = unique(availableSeason)[1])))
#     availableGender <- allOlympics[allOlympics$Gender == input$gender, "year"]
#   updateSelectInput(session, "year", choices = c(unique(as.character(availableGender), selected = unique(availableGender)[1])))
#     availableYear <- allOlympics[allOlympics$Year == input$year, "sport"]
#   updateSelectInput(session, "sport", choices = c(unique(as.character(availableYear), selected = unique(availableYear)[1])))
#     availableSport <- allOlympics[allOlympics$Sport == input$sport, "discipline"]
#   updateSelectInput(session, "dicipline", choices = c(unique(as.character(availableSport), selected = unique(availableSport)[1])))
#     availableDicipline <- allOlympics[allOlympics$Discipline == input$discipline, "sport"]
#   updateSelectInput(session, "event", choices = c(unique(as.character(availableDicipline), selected = unique(availableDicipline)[1])))
# })

 output$eventTable <- renderDataTable({

  }) 
      output$trendsplot <- renderPlot({
        plot(allOlympics$Years, allOlympics$Medal)
    
    allOlympics %>%
      filter(input$year[1] > Year, input$year[2] < Year) %>%
      filter(input$country == Country) %>%
      filter(input$discipline == Discipline) %>%
      ggplot(aes(x = Year, y = count, color = input$sortBy)) +
      geom_point()
    
  })
=======
     })
   
   trends <- observe({
     minyear <- input$year[1]
     maxyear <- input$year[2]
     country <- input$country
     discipline <- input$discipline
   
     t <- allOlympics %>%
       filter(
         Year >= minyear,
         Year <= maxyear,
       )
     
     if(
       
     )
     
     
     })
   
   
   
   
   
   
   
   
   
   
   observe ({
     updateSelectInput(session, "country", choices = )
     
   })
   
   output$trendsPlot <- renderPlot({
     
     allOlympics %>%
        filter(input$year[1] > Year, input$year[2] < Year) %>%
        filter(input$country == Country) %>%
        filter(input$discipline == Discipline) %>%
        ggplot(aes(x = Year, y = count, color = Medal)) +
        geom_point()
     
     })
>>>>>>> b1d186633776a181d232712abfaa31d6ffacdd85
}

