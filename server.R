library(shiny)
library(shinydashboard)


function(input, output, session) {
  source("athlete-tab.R")
#  source("event-tab.R")
  output$outName <- athleteNameSrv
  output$athleteTable <- athleteTableSrv
}

