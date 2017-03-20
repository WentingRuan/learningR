library("shiny")


getSiderPanel <- function() {
  sidebarPanel(
    
    textInput("be_caption", "Caption:", "Data Summary"),
    
    
    sliderInput("be_bins", "Type:Integer => Number of bins:",
                min = 1, max = 50, value = 30, 
                animate = animationOptions(interval=1000, loop=TRUE)),
    
    
    sliderInput("be_decimal", "Decimal:",
                min = 0, max = 1, value = 0.5, step= 0.1),
    
    
    sliderInput("be_range", "Range:",
                min = 1, max = 1000, value = c(200,500)),
    
    
    sliderInput("be_format", "Custom Format:",
                min = 0, max = 10000, value = 0, step = 2500,
                pre = "$", sep = ",", animate=TRUE),
    
    
    sliderInput("be_animation", "Looping Animation:", 1, 2000, 1,
                step = 10, animate=
                  animationOptions(interval=300, loop=TRUE))
  )
}

getBigExampleTabPanel <- function(){
  
  tabPanel(
    "big example",
    #  Application title
    # titlePanel("Big Example"),
    br(),
    
    # Sidebar with sliders that demonstrate various available
    # options
    sidebarLayout(
      getSiderPanel(),

      mainPanel(
        h3(textOutput("be_caption", container = span)),
        br(),
        textOutput("be_currentTime"),
        hr(),
        column(8, plotOutput("be_distPlot")),
        column(4, tableOutput("be_values"))
      ),

      position = "right",
      fluid = FALSE      
    )
  )
}

dealWithBigExampleInputOutput <- function(input, output,session) {
  
  output$be_currentTime <- renderText({
    invalidateLater(1000, session)
    paste("The current time is", Sys.time())
  })
  
  output$be_caption <- renderText({
    input$be_caption
  })
  
  d <- reactive({ data.frame(
    Name = c("Integer", 
             "Decimal",
             "Range",
             "Custom Format",
             "Animation"),
    Value = as.character(c(input$be_bins, 
                           input$be_decimal,
                           paste(input$be_range, collapse=' '),
                           input$be_format,
                           input$be_animation)),
    stringsAsFactors=FALSE)
  })
  
  # Show the values using an HTML table
  output$be_values <- renderTable({
    d()
  })
  
  output$be_distPlot <- renderPlot({
    x    <- faithful[, 2]  # Old Faithful Geyser data
    bins <- seq(min(x), max(x), length.out = input$be_bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
  })
  
  
}