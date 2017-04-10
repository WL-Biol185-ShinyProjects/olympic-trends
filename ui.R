library(shiny)
library(shinydashboard)
library(leaflet)
source("global.R")
source("athlete-tab.R")
source("event-tab.R")
source("trends-tab.R")
source("map-tab.R")

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
      
      tabItem(tabName = "home",
              fluidRow(
                box(width = 12, img(src = "rings.jpg")),
                
                box(width = 12, p("Welcome! This Shiny application utilizes Olympic 
                                  data from 1896 - 2014. The dataset includes an entry 
                                  for every Olympic medal won over the years. 
                                  Information includes the year and location of that 
                                  Olympic games, the athlete's name, country of origin, 
                                  sport, discipline, event and medal won. Our goal for 
                                  this application was to create a user-friendly interface that 
                                  enables the user to find statistics about specific 
                                  athletes and event winners, view medal winnings by countries 
                                  on a map, and create interactive plots of medal trends over time."))
              )
      ),
      
      tabItem(tabName = "athlete", 
              athleteNameUI
      ),
      
      tabItem(tabName = "event",
              eventTabUI
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

