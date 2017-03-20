library(ggplot2)
library(ggvis)


hec <- as.data.frame(xtabs(Freq ~ Hair + Eye, HairEyeColor))
hec %>% ggvis(~Hair, ~Eye, fill = ~Freq) %>% 
  layer_rects(width = band(), height = band())

hec <- as.data.frame(xtabs(Freq ~ Hair + Eye, HairEyeColor))

hec %>% 
  ggvis(~Hair, ~Eye, fill = ~Freq) %>% 
  layer_rects(width = band(), height = band()) %>%
  scale_nominal("x", padding = 0, points = FALSE) %>%
  scale_nominal("y", padding = 0, points = FALSE)

mtcars %>% ggvis() %>% layer_lines(stroke = ~cyl)

mtcars %>% ggvis(stroke = ~cyl) %>% layer_lines()