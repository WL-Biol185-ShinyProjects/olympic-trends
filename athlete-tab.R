library(shiny)

inputName <- tabItem(tabName = "athlete",
                     textInput("text", label = h3("Text input"), value = "Enter text..."),
                     hr(),
                     fluidRow(column(3, verbatimTextOutput("value"))
                     )
)



