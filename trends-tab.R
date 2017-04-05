library(shiny)
library(dplyr)
library(ggplot2)
source("global.R")

trendsUI <- fluidPage(
  fluidRow(
    titlePanel("Olympic Trends"),
    p("This tool allows you to view medal trends for a specific country and discipline throughout a selected time period."), 
    column(4,
           wellPanel(
             h4("Filter"),
             sliderInput("year", "Year", sep = "", min = 1896, max = 2014, step = 1, value = c(1896, 2014)),
             selectInput("country", "Country",
                         unique(allOlympics$Country)
             ),
             selectInput("discipline", "Discipline",
                         unique(allOlympics$Discipline)
                         
             ),
             radioButtons("sortBy", "Color By", 
                          choices = c("Medal", "Gender")
             )
           )
    ),
    column(8,
           wellPanel(
             plotOutput('trendsPlot'),
             downloadButton('downloadTrendsPlot', 'Download Plot')
           )
    )
    
  )
)
