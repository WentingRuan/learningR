roundint <- function(min, max) round(runif(1, min, max))

problem21 <- function(){
  a = roundint(11, 21)
  b = roundint(11, 21)
  list(problem=paste(a," * ", b, " = " ), expect=a*b)
}

problem11 <- function(){
  a = roundint(10, 99)
  data.frame(problem=paste(a, " * 11 = "), expect = a * 11)
}

problem8 <- function(){
  a = roundint(2, 8)
  b = roundint(11, 21)
  list(problem=paste(a, " * ", b, "= "), expect = a * b)
}


gaming <- function(n, test_maker){
  for (i in 1:n){
    test <- test_maker()
    value = readline( test$problem )
    while(TRUE){
      if (value == test$expect){
        print("right")
      } else {
        print("wrong")
        break
      }
    }
  }
}

#gaming(10, problem11)
gaming(10, problem8)
