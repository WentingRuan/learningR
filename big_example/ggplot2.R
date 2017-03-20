#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(markdown)


ggplot2Example2 <- function() {
  sidebarPanel(
    checkboxGroupInput("geom_type2", label = "geom types",
                       choices = c("ggplot_tutorial2",
                                   "geom_abline2",
                                   "geom_bar2",
                                   "geom_boxplot2",
                                   "geom_contour2",
                                   "geom_count2",
                                   "geom_crossbar2",
                                   "geom_density2",
                                   "geom_dotplot2",
                                   "geom_errorbarh2",
                                   "geom_freqploy2",
                                   "geom_hex2",
                                   "geom_jitter2",
                                   "geom_label2",
                                   "geom_map2",
                                   "geom_path2",
                                   "geom_point2",
                                   "geom_polygon2",
                                   "geom_quantile2",
                                   "geom_raster2",
                                   "geom_ribbon2",
                                   "geom_rug2",
                                   "geom_segment2",
                                   "geom_smooth2",
                                   "geom_violin2"
                                   ),
                       selected = "ggplot_tutorial2")
  )
}

# Define UI for application that draws a histogram
gg_ui <- function()fluidPage(
   
   # Application title
   titlePanel("Example"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
     sidebarPanel (
       
      # selectInput("geom_type", label = "geom types",
      #            choices = c("geom_abline"),
      #            selected = "geom_abline"),
      # 
      # checkboxGroupInput("geom_type2", label = "geom types",
      #             choices = c("geom_abline2"),
      #             selected = "geom_abline2")
       ggplot2Example2()
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         uiOutput("htmlfile2")
      )
))

# Define server logic required to draw a histogram
gg_server <- function(input, output) {
  
  # output$htmlfile <- renderUI({
  #   file <- switch (input$geom_type,
  #                   geom_abline = "geom_abline.html")
  #   
  #   includeHTML (file)
  # })
  
  output$htmlfile2 <- renderUI({
    
    file2 <- switch (input$geom_type2,
                    ggplot_tutorial2 = "ggplot2_tutorial.html",
                    geom_abline2 = "geom_abline.html",
                    geom_bar2 = "geom_bar.html",
                    geom_boxplot2 = "geom_boxplot.html",
                    geom_contour2 = "geom_contour.html",
                    geom_count2 = "geom_count.html",
                    geom_crossbar2 = "geom_crossbar.html",
                    geom_density2 = "geom_density.html",
                    geom_dotplot2 = "geom_dotplot.html",
                    geom_errorbarh2 ="geom_errorbarh.html",
                    geom_freqpoly2 = "geom_freqploy.html",
                    geom_hex2 = "geom_hex.html",
                    geom_jitter2 = "geom_jitter.html",
                    geom_label2 = "geom_label.html",
                    geom_map2 = "geom_map.html",
                    geom_path2 = "geom_path.html",
                    geom_point2 = "geom_point.html",
                    geom_polygon2 = "geom_polygon.html",
                    geom_quantile2 = "geom_quantile.html",
                    geom_raster2 = "geom_raster.html",
                    geom_ribbon2 = "geom_ribbon.html",
                    geom_rug2 = "geom_rug.html",
                    geom_segment2 = "geom_segment.html",
                    geom_smooth2 ="geom_smooth.html",
                    geom_violin2 = "geom_violin.html")
    
    includeHTML (file2)
    
  })
}

# Run the application 
shinyApp(ui = gg_ui, server = gg_server)

