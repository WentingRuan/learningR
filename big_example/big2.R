library("shiny")

getBigExample2TabPanel <- function(){
  
  tabPanel(
    "big example2",
   
    br(), 
    sidebarLayout(
      sidebarPanel(
        
        selectInput("b2_dataset", "Choose a dataset:", 
                    choices = c("rock", "pressure", "cars")),
        
        numericInput("b2_obs", "Number of observations 
                     to view:", 10)
#         submitButton("Submit change") # Without it, when input change, auto submit
      ),

      mainPanel(
          verbatimTextOutput("b2_summary"),          
          tableOutput("b2_view")
      )
    )
  )
}

dealWithBigExample2InputOutput <- function(input, output) {
  
  
  datasetInput <- reactive({
    switch(input$b2_dataset,
           "rock" = rock,
           "pressure" = pressure,
           "cars" = cars)
  })
  
  output$b2_summary <- renderPrint({
    dataset <- datasetInput()
    summary(dataset)
  })
  

  output$b2_view <- renderTable({
    head(datasetInput(), n = input$b2_obs)
  })
}
