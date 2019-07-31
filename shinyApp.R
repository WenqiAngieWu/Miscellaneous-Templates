## A template for shiny apps
## 'hover' action shows the coordinates of each points in a 2D ggplot graph 

library(plotly)
library(shiny)
library(ggplot2)

# dataframe example
data("mtcars")

shinyApp(
  ui <- shinyUI(fluidPage(
    plotlyOutput("plot1") # "plot1" is the name of the plot 
  )),
  
  server <- shinyServer(
    function(input, output) {
      output$plot1 <- renderPlotly({
        ## ggplot example
        p <- ggplot(data = mtcars) +
          geom_line(aes(x = hp, y = mpg)) +
          geom_point(aes(x = hp, y = mpg)) +
          theme_bw()
        ggplotly(p, tooltip = c("hp", "mpg")) # tooltip controls the variables to display
        
      })
    }
  ))


