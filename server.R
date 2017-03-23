library(shiny)
library(shinydashboard)
library(ggplot2)


function(input, output, session) {
  output$athleteHistory <- renderDataTable({
    
    allOlympics %>%
      filter(Athlete == input$athleteName)
  })
  
# output$season<-renderUI{
#     selectInput(inputId = "season" , label = "Season", choices = c(as.character(unique(allOlympics$Season)), selected = "All")
#     
#   )}
#   output$Gender<-renderUI{
#     available <- allOlympics[allOlympics$Season == input$season, "Gender"]
#     selectInput(inputId = "gender", label = "Gender", choices = c(unique(available), selected = unique(available[1])
#                                                
#   ))}
#   output$Year<-renderUI({
#     available <- allOlympics[allOlympics$Gender == input$gender, "Year"]
#     selectInput(inputId = "year", label = "Year", choices = c(unique(available), selected = unique(available[1]))
#                                              
#     )})
#   output$Sport<-renderUI{
#     available <- allOlympics[allOlympics$Year == input$year, "Sport"]
#     selectInput(inputId = "sport",label =  "Sport", choices = c(unique(available), selected = unique(available[1])
#                                               
#   ))
#   output$discipline<-renderUI{
#     available <- allOlympics[allOlympics$Sport == input$sport, "Discipline"]
#     selectInput(inputId = "discipline", label = "Discipline", choices = c(unique(available), selected = unique(available[1])
#                                                
#   ))
#   output$Event<-renderUI({
#     available <- allOlympics[allOlympics$Discipline == input$discipline, "Event"]
#     selectInput(inputId = "event",label = "Event", choices = c(unique(available), selected = unique(available[1]))
#   
#   )                                    
# 
# output$box1 = selectInput('season','Season',c(levels(allOlympics$Season),"select a season"),
#                           "select a season") 
# 
# output$box2 = if(is.null(input$season) || input$season == "select a season") {return()}else selectInput('year','Year',c(levels(allOlympics$Year[which(allOlympics$Season == input$season)]),"select a year"),
#                           "select a year") 
# 
# output$box3 =  if(is.null(input$year) || input$year == "select a year") {return()}else selectInput('gender','Gender',c(levels(allOlympics$Gender[which(allOlympics$Year == input$year)]),"select a gender"),
#                           "select a gender") 
# 
# output$box4 =  if(is.null(input$gender) || input$gender == "select a gender") {return()}else selectInput('sport','Sport',c(levels(allOlympics$Sport[which(allOlympics$Gender == input$gender)]),"select a sport"),
#                           "select a sport") 
# 
# output$box5 = if(is.null(input$sport) || input$sport == "select a sport") {return()}else selectInput('discipline','Discipline',c(levels(allOlympics$Discipline[which(allOlympics$Sport == input$sport)]),"select a discipline"),
#                       "select a discipline") 
# 
# output$box6 =  if(is.null(input$discipline) || input$discipline == "select a discipline") {return()}else selectInput('event','Event',c(levels(allOlympics$Event[which(allOlympics$Discipline == input$discipline)]),"select an event"),
#                             "select an event") 
# 
# subdata1 = reactive(allOlympics[which(allOlympics$Season == input$season),])
# subdata2 = reactive(subdata1()[which(subdata1()$Year == input$year),])
# subdata3 = reactive(subdata2()[which(subdata2()$Gender == input$gender),])
# subdata4 = reactive(subdata3()[which(subdata3()$Sport == input$sport),])
# subdata5 = reactive(subdata4()[which(subdata4()$Discipline == input$Discipline),])
# subdata6 = reactive(subdata5()[which(subdata1()$Event == input$event),])

# output$eventTable <- renderDataTable({
# })
# }
 
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
}

  




