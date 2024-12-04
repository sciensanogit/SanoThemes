library(dplyr)
library(ggplot2)
data(mtcars)

ggplot(data = mtcars, aes(x = mpg, y = hp, color = wt)) +
  geom_point() +
  scale_color_gradientn(colors = sano_colors[["continuous"]])

ggplot(data = mtcars, aes(x = am, fill = as.factor(carb))) +
  geom_bar() +
  scale_fill_manual(values = unname(sano_colors[["discrete"]]))



