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
     uiOutput("yearUI"),
     uiOutput("seasonGenderUI"),
     uiOutput("disciplineUI"),
     uiOutput("eventUI"),
     
     dataTableOutput('eventTable')
   )
)



  


   # column(4,
   #        selectizeInput("year",
   #                    "Year:",
   #                    c("All", unique(allOlympics$Year)))
   # ),

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


