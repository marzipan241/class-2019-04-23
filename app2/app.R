library(shiny)
library(maps)
library(mapproj)

source("class-2019-04-23/helpers.R")
counties <- readRDS("class-2019-04-23/counties.rds")


# Define UI for application that draws a histogram
ui <- fluidPage(
  titlePanel("censusVis"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Create demographic maps with 
               information from the 2010 US Census."),
      
      selectInput("var", 
                  label = "Choose a variable to display",
                  choices = c("Percent White", "Percent Black",
                              "Percent Hispanic", "Percent Asian"),
                  selected = "Percent White"),
      
      sliderInput("range", 
                  label = "Range of interest:",
                  min = 0, max = 100, value = c(0, 100))
      ),
    
    mainPanel(plotOutput("map"))
  )
  )
# Define server logic required to draw a histogram
server <- function(input, output) {
   
      # generate bins based on input$bins from ui.R
     output$map <- renderPlot({
       percent_map
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

