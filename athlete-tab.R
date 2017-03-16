library(shiny)

athleteNameUI <- fluidPage(
  textInput("athleteName", label = h3("Athlete Last Name"), value = "Enter Athlete Name..."),
  verbatimTextOutput("value")
  )

athleteNameSrv <- renderPrint({ input$athleteName })


allOlympics <- rbind(summer, winter)

##allOlympics %>%
##  filter(
##    toupper(input$athleteName) = Athlete
##  )
