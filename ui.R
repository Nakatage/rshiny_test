library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("SPY"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      helpText("Select a stock to examine. Information will be collected from Yahoo finance."),
      
      textInput("symb", h3("Symbol"), value = "Enter text..."),
      
      dateRangeInput("dates", h3("Data range")),
    
      checkboxInput("log", "Plot y axis on log scale", TRUE),
      checkboxInput("adjust", "Adjust prices for inflation", TRUE)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")
    )
  )
))
