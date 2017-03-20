#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggvis)
source("./ggvis_overview.R")
source("./ggvis_interaction.R")
source("./ggvis_type.R")




# Define UI for application that draws a histogram
ggvis_ui2 <- function()fluidPage (

  # Application title
  titlePanel("GGVIS"),

  tabsetPanel(
    type = "tabs",
    tabPanel("ggvis overview" , ggvis_overview_ui()),
    tabPanel("Interactive Graphics" , ggvis_interaction_ui()),
    tabPanel("Type demo", ggvis_type_ui2())
  ))



ggvis_server2 <- function(input, output) {


    ggvis_overview_server(input,ouput)
    ggvis_interaction_server(input,output)
    ggvis_type_server2(input,output)

  }


# Run the application
shinyApp(ui = ggvis_ui2, server = ggvis_server2)

