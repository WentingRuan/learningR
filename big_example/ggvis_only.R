## app.R ##
library("shinydashboard")
library("ggplot2")
library("ggvis")
library ("markdown")
source("./ggvis_overview1.R")
source("./ggvis_interaction1.R")


##ggvis edit
ggvisMenuItem_1 <- menuItem(
  "ggvis",
  tabName = "ggvis1",
  icon = icon("map-o")
)

ggvisItem_1 <- tabItem (
  tabName = "ggvis1",
  
  fluidPage(
    tabsetPanel(
      type = "tabs",
      
      tabPanel("ggvis overview",
               ggvis_overview_ui1()),

      tabPanel("Cookbook",
               includeMarkdown("ggvis_cookbook1.html")),
      tabPanel("Basis",
               includeHTML("ggvis_basis1.html")
      ),
      tabPanel("Interactive Graphics",
               ggvis_interaction_ui1()
      ),
      tabPanel("Axes & Legends",
               includeHTML("ggvis_axes1.html")),

      tabPanel("Properties & Scales",
               includeHTML("ggvis_properties1.html")
      ),

      tabPanel("Layers",
               includeHTML("ggvis_layers1.html")
      ),
      tabPanel("Data Hierarchy",
               includeHTML("ggvis_data_hierarchy1.html")
      ),
      tabPanel("Related to ggplot2",
               includeHTML("ggvis_ggplot2_1.html")
      ),
      tabPanel("Related to Vega",
               includeHTML("ggvis_vega1.html")
      )
      )))




ui <- dashboardPage(
  dashboardHeader(title = "Basic dashboard"),
  dashboardSidebar(
    sidebarMenu(ggvisMenuItem_1)),
  dashboardBody(tabItems(ggvisItem_1))
)

server <- function(input, output, session) {


#for ggvis
  ggvis_overview_server1(input,output)
  ggvis_interaction_server1(input,output)
}
shinyApp(ui,server)


