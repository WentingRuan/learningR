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


ggvisExample2 <- function() {
  sidebarPanel(
    checkboxGroupInput("ggvis2", label = "ggvis",
                       choices = c( "Cookbook",
                                    "Basis",
                                    "Properties & Scales",
                                    "Layers",
                                    "Data Hierarchy",
                                    "Related to ggplot2",
                                    "Related to Vega" ),
                       selected = "Cookbook")
  )
}

ggvis_type_ui2 <- function()fluidPage(
  
  # Application title
  titlePanel("GGVIS"),

  sidebarLayout(
    sidebarPanel (
      ggvisExample2 ()
    ),
       mainPanel(
      
   uiOutput("htmlfile3")

    )
  ))

# Define server logic required to draw a histogram
ggvis_type_server2 <- function(input, output) {
  
  # output$htmlfile <- renderUI({
  #   file <- switch (input$geom_type,
  #                   geom_abline = "geom_abline.html")
  #   
  #   includeHTML (file)
  # })
  
  output$htmlfile3 <- renderUI({
    
    file3 <- switch (input$ggvis2,
                     "Cookbook" = "ggvis_cookbook1.html",
                     "Basis" = "ggvis_basis1.html",
                     "Axes & Legends" = "ggvis_axes1.html",
                     "Properties & Scales" = "ggvis_properties1.html",
                     "Layers" = "ggvis_layers1.html",
                     "Data Hierarchy" = "ggvis_data_hierarchy1.html",
                     "Related to ggplot2" = "ggvis_ggplot2_1.html",
                     "Related to Vega" = "ggvis_vega_1.html" )
    
    
    includeHTML (file3)
  })
}

# Run the application 
shinyApp(ui = ggvis_type_ui2, server = ggvis_type_server2)

