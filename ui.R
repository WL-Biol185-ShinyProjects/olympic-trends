library(shiny)
library(shinydashboard)
library(leaflet)
source("global.R")
source("athlete-tab.R")
source("event-tab.R")
source("trends-tab.R")

dashboardPage(
  skin = "yellow",
  
  dashboardHeader(
    title = "Olympic Data 1896-2014",
    titleWidth = 300
  ),
  
  dashboardSidebar(
    width = 300,
    sidebarMenu(
      menuItem("Home", tabName = "home", icon = icon("home")),
      menuItem("Athlete History", tabName = "athlete", icon = icon("id-card")),
      menuItem("Event Search", tabName = "event", icon = icon("trophy")),
      menuItem("Map", tabName = "map", icon = icon("map")),
      menuItem("Trends", tabName = "trends", icon = icon("line-chart"))
    )
  ),
  
  dashboardBody(
    tabItems(
      tabItem(tabName = "home"
#              p("Welcome to ...")
      ),
      tabItem(tabName = "athlete", 
              athleteNameUI
      ),
      tabItem(tabName = "event",
              eventTabUI
      ),
      tabItem(tabName = "trends",
              trendsUI
      )
      # tabItem(tabName = "map", 
      #         mapUI
      # )
    )
  )
)

