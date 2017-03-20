getRandomTabPanel <- function(){

  tabPanel(
    "random",
    br(),
    sidebarLayout(
      sidebarPanel(
        radioButtons("r_dist", "Distribution type:",
                     c("Normal" = "norm",
                       "Uniform" = "unif",
                       "Log-normal" = "lnorm",
                       "Exponential" = "exp")),
        br(),
        
        sliderInput("r_n", 
                    "Number of observations:", 
                    value = 500,
                    min = 1, 
                    max = 1000)
      ),
      
      # Show a tabset that includes a plot, summary, and table view
      # of the generated distribution
      mainPanel(
        tabsetPanel(type = "tabs", 
                    position="right",
                    tabPanel("Plot", plotOutput("plot")), 
                    tabPanel("Summary", verbatimTextOutput("summary")), 
                    tabPanel("Table", tableOutput("table"))
        )
      )
    )
  )
}

dealWithRandomPanelInputOutput <- function(input, output){
  data <- reactive({
    dist <- switch(input$r_dist,
                   norm = rnorm,
                   unif = runif,
                   lnorm = rlnorm,
                   exp = rexp,
                   rnorm)
    
    dist(input$r_n)
  })
  
  output$plot <- renderPlot({
    dist <- input$r_dist
    n <- input$r_n
    
    hist(data(), 
         main=paste('r', dist, '(', n, ')', sep=''))
  })
  
  # Generate a summary of the data
  output$summary <- renderPrint({
    summary(data())
  })
  
  # Generate an HTML table view of the data
  output$table <- renderTable({
    data.frame(x=data())
  })
}