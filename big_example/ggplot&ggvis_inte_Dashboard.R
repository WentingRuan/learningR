## app.R ##
library("shinydashboard")
library("ggplot2")
library("ggvis")
library ("markdown")
source("./big2.R")
source("./big.R")
source("./random.R")
source("./upload.R")
source("./download.R")
source("./ggvis_overview.R")
source("./ggvis_interaction.R")
source("./ggplot2.R")
source("./ggvis_type.R")
source("./ggvis2.R")

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

ggplotMenuItem <- menuItem(
  "ggplot2",
  tabName = "ggplot2",
  icon = icon("map")
)
ggplotItem <- tabItem (
  tabName = "ggplot2",
  
  fluidPage(
    tabsetPanel(
      type = "tabs",
      
      tabPanel("geom type and examples",
               gg_ui()
               )
      )
    )
  )
##ggvis edit
ggvisMenuItem <- menuItem(
  "ggvis",
  tabName = "ggvis",
  icon = icon("map-o")
)

ggvisItem <- tabItem (
  tabName = "ggvis",
  
  fluidPage(
    
    tabsetPanel(
      type = "tabs",
      tabPanel("ggvis overview" , ggvis_overview_ui()),
      tabPanel("Interactive Graphics" , ggvis_interaction_ui()),
      tabPanel("Type demo", ggvis_type_ui2())
    ))
)
  


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


library ("markdown")

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
    sidebarMenu(dashboardMenuItem, widgetMenuItem, workMenuItem, regexMenuItem,ggplotMenuItem,ggvisMenuItem),
    sidebarSearchForm(textId = "searchText", buttonId = "searchButton",
                      label = "Search..."),
    sliderInput("slider3", "Number of observations:", 1, 100, 50)),
  dashboardBody(tabItems(dashboardItem, widgetItem, workItem, regexItem,ggplotItem,ggvisItem))
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
  
  ##ggplot2

  gg_server (input, output)
  
  output$point_dash <- renderPlot ({
    y = c(1231.493, 1034.17, 723.563, 1957.257, 2255.705, 926.898, 4170.555, 991.723, 3025.346, 1928.803, 1101.821, 1715.225, 1189.607, 1214.292, 6852.781, 3071.59, 6661.562, 11762.429, 1326.717, 4390.856, 5127.441, 2042.872, 755.421, 1624.101, 18.596, 1180.239, 3650.678)
    x <- c(33, 17, 17, 25, 42, 14, 74, 17, 74, 42, 20, 36, 29, 27, 162, 91, 116, 221, 17, 80, 114, 42, 17, 30, 27, 27, 100)
    test <- data.frame(x,y)
    
    ggplot(data = test, aes(x, y)) +
      geom_point(shape = 19,colour = "pink",size = 2) +
      geom_smooth(colour = "pink",method = "lm") +
      geom_jitter(color = "blue" ,shape = 15,alpha = 0.5) +
      geom_vline(xintercept = 100,alpha = 0.5) +
      geom_vline(xintercept = 200,alpha = 0.5) 
  })
  
  ##for ggvis
  ggvis_overview_server(input,ouput)
  ggvis_interaction_server(input,output)
  ggvis_type_server2(input,output)
  
}

app <- shinyApp(ui, server)

runApp(app, port=8888, host="0.0.0.0", display.mode = "showcase")
