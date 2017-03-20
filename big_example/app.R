library("shiny")

#setwd(getSrcDirectory( function(r) r))

cat(getwd())

source("./big2.R")
source("./big.R")
source("./random.R")
source("./upload.R")
source("./download.R")

ui <- fluidPage(
  
  titlePanel("Exhibition"),
  
  tabsetPanel(
    position=c("right"), 
    getRandomTabPanel(),
    getBigExampleTabPanel(), 
    getBigExample2TabPanel(),
    getDownloadTabPanel(),
    getUploadTabPanel()
  )
)

server <- shinyServer(
  function(input, output, session){
    dealWithRandomPanelInputOutput(input, output)
    dealWithBigExampleInputOutput(input, output, session)
    dealWithBigExample2InputOutput(input,output)
    downloadFunc(input, output)
    uploadFunc(input, output)
  })

shinyApp(
  server = server,
  ui = ui,
  options = list(
    host = getOption("shiny.host", "0.0.0.0"),
    port = getOption("shiny.port",8080),
    display.mode = "showcase"
  ))

# shinyApp(ui = ui, server = server, options = list(
#   host = getOption("shiny.host", "0.0.0.0"),
#   port = getOption("shiny.port",8080),
#   display.mode = "showcase"
#   ))

# start <- function(name){
#   shiny::runApp(
#     name,
#     host = getOption("shiny.host", "0.0.0.0"),
#     port = getOption("shiny.port",8080),
#     display.mode = "showcase"
#   )
# }

