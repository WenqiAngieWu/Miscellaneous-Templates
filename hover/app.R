#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# 'hover' action shows the coordinates of each points in a 2D ggplot graph

library(plotly)
library(shiny)
library(ggplot2)


# Dataframe example
data("mtcars")

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("mtcars"),
    
    plotlyOutput("plot1") # "plot1" is the name of the plot 
    
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$plot1 <- renderPlotly({
        ## ggplot example
        p <- ggplot(data = mtcars) +
            geom_line(aes(x = hp, y = mpg)) +
            geom_point(aes(x = hp, y = mpg)) +
            theme_bw()
        ggplotly(p, tooltip = c("hp", "mpg")) # tooltip controls the variables to display
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
