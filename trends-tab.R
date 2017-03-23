library(shiny)
library(dplyr)
library(ggplot2)

trendsUI <- fluidPage(
  titlePanel("Olympic Trends"),
  fluidRow(
    column(3,
           wellPanel(
             h4("Filter"),
             sliderInput("year", "Year", 1896, 2014, value = c(1896, 2014)),
             selectInput("country", "Country",
                         c("All", unique(as.character(allOlympics$Country)))
             ),
             selectInput("discipline", "Discipline",
                         c("All", unique(as.character(allOlympics$Discipline)))
               
             ),
             checkboxGroupInput("sortBy", "Color By",
                                choices = list("Medal" = 1, "Gender" = 2, "Country" = 3),
                                selected = 1
                                )
             ),
           
           plotOutput('trendsPlot')
           )
    
    )
)


