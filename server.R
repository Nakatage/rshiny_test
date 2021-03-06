library(shiny)
library(quantmod)
source("app.R")
source("helpers.R")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  dataInput <- reactive({
    getSymbols(input$symb, src = "yahoo",
               from = input$dates[1],
               to = input$dates[2],
               auto.assign = FALSE)
  })
  
  finalInput <- reactive({
    if(!input$adjust) return(dataInput())
    adjust(dataInput())
  })
  
  output$distPlot <- renderPlot({
    chartSeries(finalInput(), theme = chartTheme("white"),
                type = "line", log.scale = input$log, TA = NULL)
    
  })
  
})
