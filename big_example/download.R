downloadFunc <- function(input, output) {
  datasetInput <- reactive({
    switch(input$download_dataset,
           "rock" = rock,
           "pressure" = pressure,
           "cars" = cars)
  })
  
  output$download_table <- renderTable({
    datasetInput()
  })
  
  output$download_data <- downloadHandler(
    filename = function() paste(input$download_dataset, '.csv', sep=''),
    content = function(file) {
      write.csv(datasetInput(), file)
    },
    contentType = "text/csv"
  )
}

getDownloadTabPanel <- function(){
  tabPanel(
    "File Download",

    br(),
    sidebarLayout(
      sidebarPanel(
        selectInput("download_dataset", "Choose a dataset:", 
                    choices = c("rock", "pressure", "cars")),
        downloadButton('download_data', 'Download')
      ),
      mainPanel(
        tableOutput('download_table')
      )
    )
  )
}
