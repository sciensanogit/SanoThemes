
library(usethis)

sano_colors <- list(
  discrete = c(
    "midgreen" = rgb(red = 58, green = 170, blue = 53, maxColorValue = 255),
    "darkgreen" = rgb(red = 0, green = 102, blue = 51, maxColorValue = 255),
    "lightgreen" = rgb(red = 188, green = 207, blue = 0, maxColorValue = 255),
    "yellow" = rgb(red = 250, green = 213, blue = 0, maxColorValue = 255),
    "orange" = rgb(red = 242, green = 157, blue = 0, maxColorValue = 255),
    "red" = rgb(red = 201, green = 81, blue = 23, maxColorValue = 255),
    "pink" = rgb(red = 228, green = 148, blue = 192, maxColorValue = 255),
    "violet" = rgb(red = 185, green = 50, blue = 135, maxColorValue = 255),
    "purple" = rgb(red = 86, green = 59, blue = 140, maxColorValue = 255),
    "lighblue" = rgb(red = 132, green = 165, blue = 215, maxColorValue = 255),
    "greenblue" = rgb(red = 96, green = 188, blue = 184, maxColorValue = 255),
    "darkblue" = rgb(red = 34, green = 133, blue = 147, maxColorValue = 255)
  ),
  continuous = c(
    "darkgreen" = rgb(red = 0, green = 102, blue = 51, maxColorValue = 255),
    "midgreen" = rgb(red = 58, green = 170, blue = 53, maxColorValue = 255),
    "lightgreen" = rgb(red = 188, green = 207, blue = 0, maxColorValue = 255),
    "yellow" = rgb(red = 250, green = 213, blue = 0, maxColorValue = 255),
    "orange" = rgb(red = 242, green = 157, blue = 0, maxColorValue = 255),
    "red" = rgb(red = 201, green = 81, blue = 23, maxColorValue = 255)
  )
)

usethis::use_data(sano_colors, overwrite = TRUE)
