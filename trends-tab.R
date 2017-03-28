library(shiny)
library(dplyr)
library(ggplot2)

trendsUI <- fluidPage(
  titlePanel("Olympic Trends"),
  fluidRow(
    column(3,
           wellPanel(
             h4("Filter"),
             sliderInput("year", "Year", min = 1896, max = 2014, step = 1, value = c(1896, 2014)),
             selectInput("country", "Country",
                         c("All", unique(allOlympics$Country))
             ),
             selectInput("discipline", "Discipline",
                         c("All", unique(allOlympics$Discipline))
               
             ),
             radioButtons("sortBy", "Color By", 
                          choices = c("Medal", "Gender", "Country")
                          )
             ),
           
           plotOutput('trendsPlot')
           
           )
    
    )
)


