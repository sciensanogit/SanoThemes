<<<<<<< Updated upstream
#' Apply Sano Styling to a ggplot Object
#'
#' This function customizes a ggplot object by applying the Sano style, which includes specific font settings, gridline options, and other theme adjustments.
#'
#' @param x A ggplot object to be styled.
#' @param gridlines_horizontal Logical. If `TRUE`, displays horizontal gridlines. Defaults to `TRUE`.
#' @param gridlines_vertical Logical. If `TRUE`, displays vertical gridlines. Defaults to `TRUE`.
#' @param font Character. The font family to use for text elements. Defaults to `"Arial"`.
#'
#' @return A ggplot object with the Sano styling applied.
#' @export
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#' p <- ggplot(mtcars, aes(x = wt, y = mpg)) +
#'   geom_point()
#' styled_p <- style_sano_plot(p)
#' print(styled_p)
#' }
=======
library(ggplot2)
library(rlang)
library(extrafont)
data(sano_colors)

mtcars$cyl_factor <- as.factor(mtcars$cyl)

x <- ggplot(mtcars) +
  aes(disp, mpg, color = cyl_factor) +  # Gebruik 'factor(cyl)' om 'cyl' als categorisch te behandelen
  geom_point() +
  facet_grid(vs ~ gear) +  # Facetten: 'vs' bepaalt rijen, 'gear' bepaalt kolommen
  theme_minimal() +  # Minimalistische stijl
  theme(
    legend.position = "top",  # Verplaats de legenda naar boven
    legend.title = element_text(size = 10, face = "bold"),  # Pas de titel van de legenda aan
    legend.text = element_text(size = 8)  # Pas de tekst van de legenda aan
  ) +
  labs(
    color = "Cylinders",  # Geef een duidelijke titel aan de legenda
    x = "Displacement (disp)",  # Pas de x-as label aan
    y = "Miles per Gallon (mpg)"  # Pas de y-as label aan
  )

x +
  theme()

#font size and gridlines

#gridlines_horizontal = TRUE, gridlines_vertical = TRUE

>>>>>>> Stashed changes
style_sano_plot <- function(x, gridlines_horizontal = TRUE, gridlines_vertical = TRUE, font = "Arial") {

  if (!(font %in% extrafont::fonts())) {
    warning("Please specify an available font\nThe first available font will be taken:")
    message(paste0("Using font: ", extrafont::fonts()[1]))
    font <- extrafont::fonts()[1]
  }

  ## build on theme_bw
x <- x +
  ggplot2::theme_minimal() %+replace%
  ggplot2::theme(

      #Text format:
      #Markdown element for plot title
      plot.title = ggtext::element_markdown(size = 24),
      #This sets the font, size, type and colour of text for the chart's subtitle, as well as setting a margin between the title and the subtitle
      plot.subtitle = ggplot2::element_text(family=font,
                                            size=22,
                                            margin=ggplot2::margin(9,0,9,0)),
      plot.caption = ggplot2::element_blank(),
      #This leaves the caption text element empty, because it is set elsewhere in the finalise plot function

      #Legend format
      #This sets the position and alignment of the legend, removes a title and backround for it and sets the requirements for any text within the legend. The legend may often need some more manual tweaking when it comes to its exact position based on the plot coordinates.
      legend.position = "bottom",
      legend.text.align = 0,
      legend.justification = "center", #adjustment
      legend.background = ggplot2::element_blank(),
      legend.title = ggplot2::element_blank(),
      legend.key = ggplot2::element_blank(),
      legend.text = ggplot2::element_text(family=font,
                                          size=18,
                                          color="black"),
      #Axis format
      #This sets the text font, size and colour for the axis test, as well as setting the margins and removes lines and ticks. In some cases, axis lines and axis ticks are things we would want to have in the chart - the cookbook shows examples of how to do so.
      axis.title = ggplot2::element_blank(),
      axis.text = ggplot2::element_text(family=font,
                                        size=18,
                                        color="black"),
      axis.text.x = ggplot2::element_text(margin=ggplot2::margin(5, b = 10)),
      axis.ticks = ggplot2::element_blank(),
      axis.line = ggplot2::element_blank(),

      #Grid lines
      #This removes all minor gridlines and adds major y gridlines. In many cases you will want to change this to remove y gridlines and add x gridlines. The cookbook shows you examples for doing so
      panel.grid.minor = ggplot2::element_blank(),
      panel.grid.major.y = ggplot2::element_blank(),
      panel.grid.major.x = ggplot2::element_blank(),

      #Blank background
      #This sets the panel background as blank, removing the standard grey ggplot background colour from the plot
      panel.background = ggplot2::element_blank(),

      #Strip background (#This sets the panel background for facet-wrapped plots to white, removing the standard grey ggplot background colour and sets the title size of the facet-wrap title to font size 18)
      strip.background = ggplot2::element_rect(fill="#3AAA35FF"),
      strip.text = ggplot2::element_text(size  = 18, color = "white")
    )
#for facetwrap or grid
# if  (class(x$facet)[1] == "FacetWrap") {
#   if (length(x$facet$params$facets) == 1) {
#     x <- x %+replace% ggplot2::theme(legend.position = c(1, 1.12), legend.direction = "horizontal", plot.title = ggplot2::element_text(vjust = 10), plot.margin = ggplot2::margin(1.2, 0.5, 0.5, 0.5, "cm"))
#   } else if (length(x$facet$params$facets) == 2) {
#     x <- x %+replace% ggplot2::theme(legend.position = c(1, 1.20), legend.direction = "horizontal", plot.title = ggplot2::element_text(vjust = 10), plot.margin = ggplot2::margin(1, 0.5, 0.5, 0.5, "cm"))
#   }
# } else if (class(x$facet)[1] == "FacetGrid") {
#   if (length(x$facet$params$cols) == 1) {
#     x <- x %+replace% ggplot2::theme(legend.position = c(0.99, 1.12), legend.direction = "horizontal", plot.title = ggplot2::element_text(vjust = 7.6), plot.margin = ggplot2::margin(1.2, 0.5, 0.5, 0.5, "cm"))
#   } else if (length(x$facet$params$cols) == 0) {
#     x <- x %+replace% ggplot2::theme(legend.position = c(0.99, 1.05), legend.direction = "horizontal", legend.box = "horizontal", plot.title = ggplot2::element_text(vjust = 10), plot.margin = ggplot2::margin(1.3, 0.5, 0.5, 0.5, "cm"))
#   }
#}
if (gridlines_vertical == TRUE) {
  x <- x +
    ggplot2::theme(
      panel.grid.major.x = ggplot2::element_line(color="#cbcbcb", linewidth = 0.5),
    )
}
if (gridlines_horizontal == TRUE){
  x <- x +
    ggplot2::theme(
      panel.grid.major.y = ggplot2::element_line(color="#cbcbcb", linewidth = 0.5),
    )
}

## Colors do not work yet
# if (!is.null(x$labels$colour) & !is.null(x$labels$fill)) {
#   if (x$labels$fill == "fill") {
#     x[["layers"]][[1]][["aes_params"]][["colour"]] <- unname(sano_colors[["discrete"]][1])
#     x[["layers"]][[1]][["aes_params"]][["fill"]] <- unname(sano_colors[["discrete"]][2])
#     x[["layers"]][[1]][["aes_params"]][["alpha"]] <- 0.5
#   } else if (class(x$data[, as_name(x$mapping$fill)]) %in% c("factor", "character") == T) {
#     x <- x + ggplot2::scale_color_manual(values = unname(sano_colors[["discrete"]])) +
#       ggplot2::scale_fill_manual(values = unname(sano_colors[["discrete"]]))
#   } else if (class(x$data[, as_name(x$mapping$fill)]) %in% c("numeric", "integer") == T) {
#     x <- x + ggplot2::scale_colour_gradientn(
#       colours = unname(sano_colors[["continuous"]]),
#       space = "Lab", na.value = "grey50", aesthetics = "colour", guide = ggplot2::guide_colourbar()
#     ) + ggplot2::guides(colour = ggplot2::guide_colourbar(barwidth = 10, barheight = 0.4)) +
#       ggplot2::scale_fill_gradientn(
#         colours = unname(sano_colors[["continuous"]]),
#         space = "Lab", na.value = "grey50", aesthetics = "fill", guide = ggplot2::guide_colourbar()
#       ) + ggplot2::guides(fill = ggplot2::guide_colourbar(barwidth = 10, barheight = 0.4))
#   }
# } else if (!is.null(x$labels$colour)) {
#   if (class(x$data[, as_name(x$mapping$colour)]) %in% c("factor", "character") == T) {
#     x <- x + ggplot2::scale_color_manual(values = unname(sano_colors[["discrete"]]))
#   } else if (class(x$data[, as_name(x$mapping$colour)]) %in% c("numeric", "integer") == T) {
#     x <- x + ggplot2::scale_colour_gradientn(
#       colours = sano_colors[["continuous"]],
#       space = "Lab", na.value = "grey50", aesthetics = "colour", guide = ggplot2::guide_colourbar()
#     ) + ggplot2::guides(colour = ggplot2::guide_colourbar(barwidth = 10, barheight = 0.4))
#   } } else if (!is.null(x$labels$fill)) {
#     if (x$labels$fill == "fill") {
#       x[["layers"]][[1]][["aes_params"]][["colour"]] <- unname(sano_colors[["discrete"]][1])
#       x[["layers"]][[1]][["aes_params"]][["fill"]] <- unname(sano_colors[["discrete"]][2])
#       x[["layers"]][[1]][["aes_params"]][["alpha"]] <- 0.5
#     }else if (class(x$data[, as_name(x$mapping$fill)]) %in% c("factor", "character") == T) {
#       x <- x + ggplot2::scale_fill_manual(values = unname(sano_colors[["discrete"]]))
#     }else if (class(x$data[, as_name(x$mapping$fill)]) %in% c("numeric", "integer") == T) {
#       x <- x + ggplot2::scale_fill_gradientn(
#         colours = unname(sano_colors[["continuous"]]),
#         space = "Lab", na.value = "grey50", aesthetics = "fill", guide = ggplot2::guide_colourbar()
#       ) + ggplot2::guides(fill = ggplot2::guide_colourbar(barwidth = 10, barheight = 0.4)) +
#         ggplot2::scale_fill_gradientn(
#           colours = sano_colors[["continuous"]],
#           space = "Lab", na.value = "grey50", aesthetics = "colour", guide = ggplot2::guide_colourbar()
#         ) + ggplot2::guides(colour = ggplot2::guide_colourbar(barwidth = 10, barheight = 0.4))
#     }
#   } else {
#     x[["layers"]][[1]][["aes_params"]][["colour"]] <- unname(sano_colors[["discrete"]][1])
#     x[["layers"]][[1]][["aes_params"]][["fill"]] <- unname(sano_colors[["discrete"]][2])
#     x[["layers"]][[1]][["aes_params"]][["alpha"]] <- 0.5
#   }


return(x)
}



