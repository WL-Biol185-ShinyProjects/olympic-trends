library(shiny)

athleteLastNameUI <- fluidPage(
  textInput("athleteLastName", label = h3("Athlete Last Name"), value = "Enter Last Name..."),
  verbatimTextOutput("value")
  )

athleteFirstNameUI <- fluidPage(
  textInput("athleteFirstName", label = h3("Athlete First Name"), value = "Enter First Name or Initial..."),
  verbatimTextOutput("value")
)

athleteLastNameSrv <- renderPrint({ input$athleteLastName })
athleteFirstNameSrv <- renderPrint({ input$athleteFirstName })

#formatLastName <- toupper(input$athleteLastName)
# dont know how to format this argument but...
#formatFirstName <- tolower(input$athleteFirstName) && toupper(input$athleteFirstName[1])
#formattedName <- cbind(formatLastName, ", ", formatFirstName)

allOlympics <- rbind(summer, winter)

<<<<<<< HEAD
##allOlympics %>%
##  filter(
##    toupper(input$athleteName) = Athlete
##  )
=======
#output$history <- renderTable({
#  filtered <-
#    allOlympics %>%
#    filter(Athlete == formattedName)
#})

>>>>>>> 384101f00c08bf2893117afd10e3d8ce005993c3
