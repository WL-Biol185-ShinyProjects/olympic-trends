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
   
   trends <- observe({
     minyear <- input$year[1]
     maxyear <- input$year[2]
   
     t <- allOlympics %>%
       filter(
         Year >= minyear,
         Year <= maxyear
         )%>%
   
       

     
     if(input$country != "All") {
       country<- paste0("%", input$country, "%")
      t = t %>% filter(COuntry %like% country)
     }
     if(!is.null(input$discipline) && input$discipline != "") {
       discipline <- paste0("%", input$discipline, "%")
       t <- t %>% filter(Discipline %like% discipline)

     }
   output$trendsPlot <- renderPlot({  
   ggplot(aes(x = Year, y = count, color = Medal)) +
     geom_point()
   })
})
   )
  
#    observe ({
#      updateSelectInput(session, "country", choices = )
#      
#    })
#    
#    output$trendsPlot <- renderPlot({
#      
#      allOlympics %>%
#         filter(input$year[1] > Year, input$year[2] < Year) %>%
#         filter(input$country == Country) %>%
#         filter(input$discipline == Discipline) %>%
#         ggplot(aes(x = Year, y = count, color = Medal)) +
#         geom_point()
#    })
# }
