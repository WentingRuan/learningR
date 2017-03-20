library("shiny")

local_func <- function(r) r

cat(getSrcDirectory(local_func))

shinyAppDir(getSrcDirectory(local_func),
         options = list(
           host = getOption("shiny.host", "0.0.0.0"),
           port = getOption("shiny.port",8080),
           display.mode = "showcase"
         ))

runExample2 <- function(example){
  runExample(
    example,
    host = getOption("shiny.host", "0.0.0.0"),
    port = getOption("shiny.port",8080),
    display.mode = "showcase")
}
