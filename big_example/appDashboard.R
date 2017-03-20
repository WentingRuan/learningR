## app.R ##
library(shinydashboard)

source("./big2.R")
source("./big.R")
source("./random.R")
source("./upload.R")
source("./download.R")

dashboardMenuItem <- menuItem(
  "Dashboard",
  tabName = "dashboard",
  icon = icon("dashboard")
)
dashboardItem <- tabItem(
  tabName = "dashboard",
  fluidRow(
    box(plotOutput("plot1", height = 250)),
    box(
      title = "Controls",
      h1("123"),
      sliderInput("slider1", "Number of observations:", 1, 100, 50)
    ),
    box(
      title = "Histogram", background = "maroon", solidHeader = TRUE,
      plotOutput("plot4", height = 250)
    ),
    
    box(
      title = "Inputs", background = "black",
      "Box content here", br(), "More box content",
      sliderInput("slider3", "Slider input:", 1, 100, 50),
      textInput("text", "Text input:")
    )
  ))

widgetMenuItem <- menuItem("Widgets", tabName = "widgets", icon = icon("th"))
widgetItem <- tabItem(tabName = "widgets", 
                      h2("Widgets tab content"),
                      textOutput("textout"),
                      textOutput("regex"),
                      includeMarkdown("r.md"))

regexMenuItem <- menuItem("regex demo", tabName = "regex", icon = icon("th"))
regexItem <- tabItem(tabName = "regex", 
                     # includeHTML("regex_demo.html")
                     includeMarkdown("regex_demo.md")
                     )


library("markdown")

workMenuItem <- menuItem("Work", tabName = "work", icon = icon("gift"))
workItem <- tabItem(
  tabName = "work", 
  
  fluidPage(
    
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
)

message_menu <- dropdownMenu(
  type = "messages",
  messageItem(
    from = "Sales Dept",
    message = "Sales are steady this month."
  ),
  messageItem(
    from = "New User",
    message = "How do I register?",
    icon = icon("question"),
    time = "13:45"
  ),
  messageItem(
    from = "Support",
    message = "The new server is ready.",
    icon = icon("life-ring"),
    time = "2014-12-01"
  )
)

notification_menu <- dropdownMenu(
  type = "notifications",
  notificationItem(
    text = "5 new users today",
    icon("users")
  ),
  notificationItem(
    text = "12 items delivered",
    icon("truck"),
    status = "success"
  ),
  notificationItem(
    text = "Server load at 86%",
    icon = icon("exclamation-triangle"),
    status = "warning"
  )
)

ui <- dashboardPage(
  dashboardHeader(title = "Basic dashboard", message_menu, notification_menu, dropdownMenuOutput("tasks_menu")),
  dashboardSidebar(
    sidebarMenu(dashboardMenuItem, widgetMenuItem, workMenuItem, regexMenuItem),
    sidebarSearchForm(textId = "searchText", buttonId = "searchButton",
                      label = "Search..."),
    sliderInput("slider3", "Number of observations:", 1, 100, 50)),
  dashboardBody(tabItems(dashboardItem, widgetItem, workItem, regexItem))
)

server <- function(input, output, session) {
  set.seed(122)
  histdata <- rnorm(500)
  
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider1)]
    hist(data)
  })
  
  output$textout <- renderText({
    input$searchButton
    isolate({input$searchText})
    #input$searchText
  })
  
  output$regex <- renderText({
    input$searchButton
    grep("[a-z]", letters, value=TRUE)
  })
  
  output$tasks_menu <- renderMenu({
    dropdownMenu(
      type="tasks",
      taskItem(value = input$slider3, color = "green",
               "Documentation"
      ))
  })
  
  dealWithRandomPanelInputOutput(input, output)
  dealWithBigExampleInputOutput(input, output, session)
  dealWithBigExample2InputOutput(input,output)
  downloadFunc(input, output)
  uploadFunc(input, output)
}

app <- shinyApp(ui, server)

runApp(app, port=8888, host="0.0.0.0", display.mode = "showcase")
