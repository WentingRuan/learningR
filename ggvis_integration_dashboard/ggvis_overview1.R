
library(shiny)
library(ggvis)

# Define UI for application that draws a histogram
ggvis_overview_ui1 <- function(){
  fluidPage (
   
   # Application title
   titlePanel("ggvis 0.4 overview"),
   
   sidebarLayout(
     sidebarPanel (
       h3("Getting started with ggvis"),
       p("See some",span("recipes", style = "color:blue"), "for common tasks."),
       p("Learn",span("ggvis basics", style = "color:blue")),
       p("Read more about",span("interactive graphics.",style = "color:blue")),
       br(),
       
       h3("More advanced topics"),
       p(" How to control",span("axes and legends", style = "color:blue")),
       p(" How to use",span("properties and scales",style = "color:blue")),
       p(" Learn about",span("layers.", style = "color:blue")),
       p(" Plumbing: about ggvis’s",span("data hierarchy.", style = "color:blue")),
       br(),
       
       h3("More about ggvis"),
       p(" Differences and similarities to ggplot2."),
       p(" The relationship between ggvis and Vega.")
       
     ),
     mainPanel (
   
   h2("ggvis is a data visualization package for R which lets you:"),
   br(),
   strong("Declaratively describe data graphics with a syntax similar in spirit
     to ggplot2."),
   br(),
   strong(
     "Create rich interactive graphics that you can play with locally in
     Rstudio or in your browser."
   ),
   br(),
   strong(
     "Leverage shiny infrastructure to publish interactive graphics
     usable from any browser (either within your company or to the world)."
   ),
   br(),
   br(),
   p("The goal is to combine the best of R (e.g. every modelling function you can imagine) and the best of the web (everyone has a web browser). Data manipulation and transformation are done in R, and the graphics are rendered in a web browser, using Vega. For RStudio users, ggvis graphics display in a viewer panel, which is possible because RStudio is a web browser."
   ),
   h2("examples"),
   uiOutput("faithful_ui"),
   ggvisOutput("faithful"),
   br(),
   uiOutput("mtcars_ui"),
   ggvisOutput("mtcars"),
   sliderInput(
     inputId = "span1",
     label = "input_slider",
     min = 0,
     max = 1,
     step = 0.01,
     value = 0.5
   )),
  position = "right"))
}
   



# Define server logic required to draw a histogram
ggvis_overview_server1 <- function(input, output) {

  faithful %>% 
    ggvis( ~ eruptions) %>% 
    layer_histograms() %>% 
    bind_shiny("faithful", "faithful_ui")
  
  input_span <- reactive(input$span1)
  
  mtcars %>% ggvis(~ wt,  ~ mpg) %>%
    layer_model_predictions(model = "lm", stroke := "red") %>%
    layer_smooths(opacity := 0.5, span = input_span) %>%
    layer_points() %>%
    bind_shiny("mtcars", "mtcars_ui")
  
}

# Run the application 

