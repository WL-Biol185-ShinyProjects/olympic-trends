library(shinydashboard)
library(shiny)
library(leaflet)
source("athlete-tab.R")
source("event-tab.R")
source("trends-tab.R")
source("map-tab.R")


dashboardPage(
  skin = "yellow",
  
  dashboardHeader(
    title = "Olympic Data 1896-2014",
    titleWidth = 350
  ),
  
  dashboardSidebar(
    width = 350,
    sidebarMenu(
      menuItem("Athlete History", tabName = "athlete", icon = icon("id-card")),
      menuItem("Event Search", tabName = "event", icon = icon("trophy")),
      menuItem("Map", tabName = "map", icon = icon("map")),
      menuItem("Trends", tabName = "trends", icon = icon("line-chart"))
    )
  ),
  
  dashboardBody(
    tabItems(
      tabItem(tabName = "athlete", 
              athleteNameUI
      ),
      tabItem(tabName = "event",
              eventUI
      ),
      tabItem(tabName = "trends",
              trendsUI
      ),
      tabItem(tabName = "map", 
              mapUI
      )
    )
  )
)

