library(shiny)
library(shinydashboard)
source("athlete-tab.R")

function(input, output) {
  output$value <- athleteNameSrv
}


