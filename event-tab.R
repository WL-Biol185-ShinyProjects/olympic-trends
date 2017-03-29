library(shiny)
library(dplyr)
library(ggplot2)

eventUI <- fluidPage(
  titlePanel("Event Winners"),
   fluidRow(
     selectizeInput("season", "Season:",
                    c("All", unique(allOlympics$Season))),
     selectizeInput("gender", "Gender:",
                    c("All", unique(allOlympics$Gender))),
     uiOutput("seasonGender")
   )
)



  


   # column(4,
   #        selectizeInput("gender",
   #                    "Gender:",
   #                    c("All", unique(allOlympics$Gender)))
   # ),
   # column(4,
   #        selectizeInput("year",
   #                    "Year:",
   #                    c("All", unique(allOlympics$Year)))
   # ),
   # column(4,
   #        selectizeInput("sport",
   #                    "Sport:",
   #                    c("All", unique(allOlympics$Sport)))
   #        ),
   # column(4,
   #        selectizeInput("discipline",
   #                    "Discipline:",
   #                    c("All", unique(allOlympics$Discipline)))
   #        ),
   # column(4,
   #        selectizeInput("event",
   #                    "Event:",
   #                    c("All", unique(allOlympics$Event)))
   #        )
   # ),
   
   # dataTableOutput('eventTable')
   # 

  
# sidebarPanel(
#   dataTableOutput("Season"),
#   dataTableOutput("Gender"),
#   dataTableOutput("Year"),
#   dataTableOutput("Sport"),
#   dataTableOutput("Discipline"),
#   dataTableOutput("Event"))


