#' Title
#'
#' @param plot_name the name of your exported plot and format as "plot.jpg"
#' @param plot the plot object
#' @param height the height in pixels
#' @param width the width in pixels
#' @param source the data source
#'
#' @return save your plot in a sano style
#'
#' @export
#'
#' @examples
#' \dontrun{
#' save_sano_plot("plot.jpg",plot)
#' }

save_sano_plot<-function(plot_name,plot, height=1000, width=1500, source=NULL){

  height_pixels<-500

  footer<-grid::grobTree(grid::linesGrob(x = grid::unit(c(0, 1), "npc"), y = grid::unit(1.2, "npc")),
                         grid::textGrob(source,
                                        x = 0.004, hjust = 0, gp = grid::gpar(fontsize=10)),
                         grid::rasterGrob(png::readPNG(file.path(system.file("logo", package = 'SanoThemes'),
                                                                 "sciensano_logo.png")),
                                          grid::unit(x = 0.900,"npc")))


  plt<-ggpubr::ggarrange(plot, footer,
                         ncol = 1, nrow = 2,
                         heights = c(1,0.10/(height_pixels/450)))


  ggplot2::ggsave(plot_name, plt,width =width ,height =height, units = "px")}



