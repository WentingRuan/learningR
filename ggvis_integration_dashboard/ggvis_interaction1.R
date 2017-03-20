
library(shiny)
library(ggvis)

# Define UI for application that draws a histogram
ggvis_interaction_ui1 <- function() {
  
  fluidPage (
  
  # Application title
  titlePanel("Interactive Graphics"),
  strong(
    "Note: If you are viewing the HTML version of this document generated with knitr, the examples will have their interactive features disabled. You will need to run the code in R to see and use the interactive controls."
  ),
  br(),
  p(
    "
Ggvis interactivity is built on top of Shiny??s reactive programming model. It??s possible to use ggvis without understanding how Shiny works, but you??ll be limited to relatively simple interactions. The first part of this vignette describes basic interactive controls, which provide a quick and easy way to add basic interactivity to a plot. They are not very flexible, but they cover the most common interactive needs and you don??t need to know anything about Shiny to use them
    "),
  br(),
  p(
    "
    The second part of this vignette shows you how to",span("embedding a ggvis in a Shiny app.",style = "color:blue"), "This gives you complete freedom to make any component of the plot interactive, to display multiple plots on one page, and to freely arrange controls. The downside is that you will need more code, and you willl need at least a basic understanding of Shiny. If you are not already familiar with how Shiny works, I recommend that you first read through the Shiny tutorial
    "
  ),
  h1("Basic interactive controls"),
  p(
    "
A plot with basic interactive controls looks very similar to a static plot. You just replace constant values with functions that produce interactive controls like:
    "
  ),
  code("input_slider()"),
  br(),
  code("
mtcars %>%
  ggvis(~wt, ~mpg) %>%
       layer_smooths(span = input_slider(0.5, 1, value = 1)) %>%
       layer_points(size := input_slider(100, 1000, value = 100))
       "),

  uiOutput("mtcars_ui_11"),
  ggvisOutput("mtcars_11"),
  sliderInput(
    inputId = "span_11",
    label = "span_slider",
    min = 0,
    max = 1,
    step = 0.01,
    value = 0.5
  ),
  sliderInput(
    inputId = "size_11",
    label = "size_slider",
    min = 100,
    max = 1000,
    step = 100,
    value = 100
  ))
}


# Define server logic required to draw a histogram
ggvis_interaction_server1 <- function(input, output) {
 
  input_span_11 <- reactive(input$span_11)
  input_size_11 <- reactive(input$size_11)

  mtcars %>%
    ggvis(~ wt, ~ mpg) %>%
    layer_smooths(span = input_span_11) %>%
    layer_points(size := input_size_11) %>%
    bind_shiny("mtcars_11", "mtcars_ui_11")
}

# Run the application 

shinyApp(ui = ggvis_interaction_ui1, server = ggvis_interaction_server1)