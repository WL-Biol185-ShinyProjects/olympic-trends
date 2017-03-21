library(shiny)
library(dplyr)

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
  ),
  dataTableOutput('eventTable')
  
)
  



