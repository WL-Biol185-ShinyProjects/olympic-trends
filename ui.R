library(shinydashboard)

dashboardPage(
  dashboardHeader(title = "Olympic Data 1896-2014"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Event Search", tabName = "event", icon = icon("trophy")),
      menuItem("Athlete History", tabName = "athlete", icon = icon("id-card")),
      menuItem("Map", tabName = "map", icon = icon("map")),
      menuItem("Trends", tabName = "trends", icon = icon("line-chart"))
    )
  ),
  dashboardBody(
    tabItems(
      source(athlete-tab.R~inputName)
    )
  )
)

