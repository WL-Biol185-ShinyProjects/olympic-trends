library(shiny)
library(dplyr)
library(ggplot2)
source("global.R")

trendsUI <- fluidPage(
  titlePanel("Olympic Trends"),
  fluidRow(
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
             plotOutput('trendsPlot')
           )
    )
  )
)
