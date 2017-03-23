library(shiny)
library(dplyr)
library(ggplot2)

eventUI <- fluidPage(titlePanel("Event Winners"),
   fluidRow(
     column(4,
            selectizeInput("season",
                        "Season:",
                        c("All",
                          unique(as.character(allOlympics$Season))))
   ),
   column(4,
          selectizeInput("gender",
                      "Gender:",
                      c("All",
                        unique(as.character(allOlympics$Gender))))
   ),
   column(4,
          selectizeInput("year",
                      "Year:",
                      c("All",
                        unique(as.character(allOlympics$Year))))
   ),
   column(4,
          selectizeInput("sport",
                      "Sport:",
                      c("All",
                        unique(as.character(allOlympics$Sport))))
          ),
   column(4,
          selectizeInput("discipline",
                      "Discipline:",
                      c("All",
                        unique(as.character(allOlympics$Discipline))))
          ),
   column(4,
          selectizeInput("event",
                      "Event:",
                      c("All",
                        unique(as.character(allOlympics$Event))))
          )
   ),
   dataTableOutput('eventTable')
   
 )
  
# sidebarPanel(
#   dataTableOutput("Season"),
#   dataTableOutput("Gender"),
#   dataTableOutput("Year"),
#   dataTableOutput("Sport"),
#   dataTableOutput("Discipline"),
#   dataTableOutput("Event"))


