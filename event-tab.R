library(shiny)
library(dplyr)

seasonUI <- fluidPage(
  selectInput('season',
              'Select Season',
              unique(allOlympics$Season)
  )
)

# seasonSrv <- renderPrint(input$season)

#genderUI <- fluidPage(
#  selectInput('gender', 
#              'Select Gender',
#              unique(allOlympics$Gender)
#  )
#)

#genderSrv <- renderPrint(input$gender)

# eventSrv <- function(input, output) 
#   output$table <- DT:renderDataTable((DT::datatable{data <- allOlympics
#   if (input$Season != "All") {
#     data <- data[data$Season == inout$season,]
#   }
#   if (input&gender !="All" {
#    data <- data[data$gender == input$gender,]
#   }
#     data
#   )
# }

eventUI <- fluidPage(
  titlePanel("Event Winners"),
  fluidRow(
    column(4,
           selectInput("season",
                       "Season:",
                       c("All",
                         unique(as.character(allOlympics$Season))))
  ),
  column(4,
         selectInput("gender",
                     "Gender:",
                     c("All",
                       unique(as.character(allOlympics$Gender))))
  ),
  column(4,
         selectInput("year",
                     "Year:",
                     c("All",
                       unique(as.character(allOlympics$Year))))
  ),
  column(4,
         selectInput("sport",
                     "Sport:",
                     c("All",
                       unique(as.character(allOlympics$Sport))))
         ),
  column(4,
         selectInput("discipline",
                     "Discipline:",
                     c("All",
                       unique(as.character(allOlympics$Discipline))))
         ),
  column(4,
         selectInput("event",
                     "Event:",
                     c("All",
                       unique(as.character(allOlympics$Event))))
         )
  )
)
  



