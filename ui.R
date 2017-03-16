library(shinydashboard)
source("athlete-tab.R")

dashboardPage(
  dashboardHeader(title = "Olympic Data 1896-2014"),
  dashboardSidebar(
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
              athleteLastNameUI,
              athleteFirstNameUI
      )
    )
  )
)
