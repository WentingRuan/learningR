# regex_examples



##Regular Expression Pattern


```r
text <- c("123456789ca@b.com a@qq.com", "123acb@qq.com")

# "?:" means do not capture ".com""
rex <- "([a-z]+)@([acb]|qq)+.(?:com)"
```

##Pattern Matching and Replacement
###regexpr 
search for matches to argument pattern within each element of a character vector

```r
#capture only the first qualified token in each vector
regexpr(rex,c("123456789ca@b.com a@qq.com", "123acb@qq.com"))
```

```
## [1] 10  4
## attr(,"match.length")
## [1]  8 10
## attr(,"useBytes")
## [1] TRUE
```

###gregexpr 

```r
#capture all the qualified tokens
gregexpr(rex,c("123456789ca@b.com a@qq.com", "123acb@qq.com")) 
```

```
## [[1]]
## [1] 10 19
## attr(,"match.length")
## [1] 8 8
## attr(,"useBytes")
## [1] TRUE
## 
## [[2]]
## [1] 4
## attr(,"match.length")
## [1] 10
## attr(,"useBytes")
## [1] TRUE
```

###regmatches

```r
#extract or replace matched substrings
regmatches(c("123456789ca@b.com a@qq.com", "123acb@qq.com"), gregexpr(rex, c("123456789ca@b.com a@qq.com", "123acb@qq.com")))
```

```
## [[1]]
## [1] "ca@b.com" "a@qq.com"
## 
## [[2]]
## [1] "acb@qq.com"
```

###regexec

```r
#extract the exact matched parts of patten in the text
regexec(rex,c("123456789ca@b.com a@qq.com", "123acb@qq.com")) 
```

```
## [[1]]
## [1] 10 10 13
## attr(,"match.length")
## [1] 8 2 1
## attr(,"useBytes")
## [1] TRUE
## 
## [[2]]
## [1] 4 4 8
## attr(,"match.length")
## [1] 10  3  2
## attr(,"useBytes")
## [1] TRUE
```


##gregexpr_matches 
##regexec_matches


```r
gregexpr_matches <- function(pattern, text){ regmatches(text, gregexpr(pattern, text))}
regexec_matches <- function(pattern, text){ regmatches(text, regexec(pattern, text))}

#split the functions and analyze them
gregexpr(rex, text)
```

```
## [[1]]
## [1] 10 19
## attr(,"match.length")
## [1] 8 8
## attr(,"useBytes")
## [1] TRUE
## 
## [[2]]
## [1] 4
## attr(,"match.length")
## [1] 10
## attr(,"useBytes")
## [1] TRUE
```

```r
a0 <- regmatches(text, gregexpr(rex, text))
regexec(rex, a0[[1]])
```

```
## [[1]]
## [1] 1 1 4
## attr(,"match.length")
## [1] 8 2 1
## attr(,"useBytes")
## [1] TRUE
## 
## [[2]]
## [1] 1 1 3
## attr(,"match.length")
## [1] 8 1 2
## attr(,"useBytes")
## [1] TRUE
```

```r
regmatches(a0[[1]], regexec(rex,a0[[1]]))
```

```
## [[1]]
## [1] "ca@b.com" "ca"       "b"       
## 
## [[2]]
## [1] "a@qq.com" "a"        "qq"
```

###gregexpr_matches 

```r
gregexpr_matches(rex, text)
```

```
## [[1]]
## [1] "ca@b.com" "a@qq.com"
## 
## [[2]]
## [1] "acb@qq.com"
```

###regexec_match vector1 

```r
a1<-gregexpr_matches(rex, text)[[1]]
a1
```

```
## [1] "ca@b.com" "a@qq.com"
```

```r
regexec_matches(rex, a1)
```

```
## [[1]]
## [1] "ca@b.com" "ca"       "b"       
## 
## [[2]]
## [1] "a@qq.com" "a"        "qq"
```

###regexec_match vector2

```r
a2<-gregexpr_matches(rex, text)[[2]]
a2 
```

```
## [1] "acb@qq.com"
```

```r
regexec_matches(rex,a2)
```

```
## [[1]]
## [1] "acb@qq.com" "acb"        "qq"
```

##substring str

```r
res <- gregexpr(rex,text)
res
```

```
## [[1]]
## [1] 10 19
## attr(,"match.length")
## [1] 8 8
## attr(,"useBytes")
## [1] TRUE
## 
## [[2]]
## [1] 4
## attr(,"match.length")
## [1] 10
## attr(,"useBytes")
## [1] TRUE
```

```r
b1<- res[[1]][1]
b1
```

```
## [1] 10
```

```r
b2<- attr(res[[1]], "match.length")[1]
b2
```

```
## [1] 8
```

###substring vector1-1

```r
text
```

```
## [1] "123456789ca@b.com a@qq.com" "123acb@qq.com"
```

```r
substring(text[1], b1, b1+b2-1)
```

```
## [1] "ca@b.com"
```

```r
substr(text[1], b1, b1+b2-1)
```

```
## [1] "ca@b.com"
```

###substring vector1-2

```r
b3 <- res[[1]][2]
b3
```

```
## [1] 19
```

```r
b4 <- attr(res[[1]],"match.length")[2]
b4
```

```
## [1] 8
```

```r
substring(text[1], b3, b3+b4-1)
```

```
## [1] "a@qq.com"
```

```r
substr(text[1], b3, b3+b4-1)
```

```
## [1] "a@qq.com"
```

##substring vector2

```r
substring(text[2], res[[2]][1], res[[2]][1]+attr(res[[2]], "match.length")[1])
```

```
## [1] "acb@qq.com"
```

```r
regmatches
```

```
## function (x, m, invert = FALSE) 
## {
##     if (length(x) != length(m)) 
##         stop(gettextf("%s and %s must have the same length", 
##             sQuote("x"), sQuote("m")), domain = NA)
##     ili <- is.list(m)
##     useBytes <- if (ili) 
##         any(unlist(lapply(m, attr, "useBytes")))
##     else any(attr(m, "useBytes"))
##     if (useBytes) {
##         asc <- iconv(x, "latin1", "ASCII")
##         ind <- is.na(asc) | (asc != x)
##         if (any(ind)) 
##             Encoding(x[ind]) <- "bytes"
##     }
##     if (!ili && identical(invert, FALSE)) {
##         so <- m[ind <- (!is.na(m) & (m > -1L))]
##         eo <- so + attr(m, "match.length")[ind] - 1L
##         return(substring(x[ind], so, eo))
##     }
##     y <- if (is.na(invert)) {
##         Map(function(u, so, ml) {
##             if ((n <- length(so)) == 1L) {
##                 if (is.na(so)) 
##                   return(NA_character_)
##                 else if (so == -1L) 
##                   return(u)
##             }
##             eo <- so + ml - 1L
##             if (n > 1L) {
##                 if (any(eo[-n] >= so[-1L])) 
##                   stop(gettextf("need non-overlapping matches for %s", 
##                     sQuote("invert = NA")), domain = NA)
##             }
##             beg <- c(1L, c(rbind(so, eo + 1L)))
##             end <- c(c(rbind(so - 1L, eo)), nchar(u))
##             substring(u, beg, end)
##         }, x, m, if (ili) 
##             lapply(m, attr, "match.length")
##         else attr(m, "match.length"), USE.NAMES = FALSE)
##     }
##     else if (invert) {
##         Map(function(u, so, ml) {
##             if ((n <- length(so)) == 1L) {
##                 if (is.na(so)) 
##                   return(NA_character_)
##                 else if (so == -1L) 
##                   return(u)
##             }
##             beg <- if (n > 1L) {
##                 eo <- so + ml - 1L
##                 if (any(eo[-n] >= so[-1L])) 
##                   stop(gettextf("need non-overlapping matches for %s", 
##                     sQuote("invert = TRUE")), domain = NA)
##                 c(1L, eo + 1L)
##             }
##             else {
##                 c(1L, so + ml)
##             }
##             end <- c(so - 1L, nchar(u))
##             substring(u, beg, end)
##         }, x, m, if (ili) 
##             lapply(m, attr, "match.length")
##         else attr(m, "match.length"), USE.NAMES = FALSE)
##     }
##     else {
##         Map(function(u, so, ml) {
##             if (length(so) == 1L) {
##                 if (is.na(so) || (so == -1L)) 
##                   return(character())
##             }
##             substring(u, so, so + ml - 1L)
##         }, x, m, lapply(m, attr, "match.length"), USE.NAMES = FALSE)
##     }
##     names(y) <- names(x)
##     y
## }
## <bytecode: 0x0000000016f17c18>
## <environment: namespace:base>
```

```r
a3 <- substring(text[2], res[[2]][1], res[[2]][1]+attr(res[[2]], "match.length")[1])
regmatches(a3,regexec(rex,a3))
```

```
## [[1]]
## [1] "acb@qq.com" "acb"        "qq"
```


```r
 sub("[a-z]{3,5}", 123, c("abcde123abc"))
```

```
## [1] "123123abc"
```

```r
 gsub("[a-z]{3,5}", 123, c("abcde123abc"))
```

```
## [1] "123123123"
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
