uploadFunc <- function(input, output) {
  output$upload_contents <- renderTable({
    
    # input$file1 will be NULL initially. After the user selects
    # and uploads a file, it will be a data frame with 'name',
    # 'size', 'type', and 'datapath' columns. The 'datapath'
    # column will contain the local filenames where the data can
    # be found.
    
    inFile <- input$upload_file1
    
    if (is.null(inFile))
      return(NULL)
    
    read.csv(inFile$datapath, header=input$upload_header, sep=input$upload_sep, 
             quote=input$upload_quote)
  })
}

getUploadTabPanel <- function(){
  tabPanel(
    "File Upload",

    br(),
    sidebarLayout(
      sidebarPanel(
        fileInput('upload_file1', 'Choose CSV File',
                  accept=c('text/csv', 
                           'text/comma-separated-values,text/plain', 
                           '.csv')),
        tags$hr(),
        checkboxInput('upload_header', 'Header', TRUE),
        radioButtons('upload_sep', 'Separator',
                     c(Comma=',',
                       Semicolon=';',
                       Tab='\t'),
                     ','),
        radioButtons('upload_quote', 'Quote',
                     c(None='',
                       'Double Quote'='"',
                       'Single Quote'="'"),
                     '"')
      ),
      mainPanel(
        tableOutput('upload_contents')
      )
    )
  )
}

