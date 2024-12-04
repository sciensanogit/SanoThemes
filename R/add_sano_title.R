#' Add a Styled Title to a ggplot
#'
#' This function adds a styled title to a ggplot object, incorporating a figure number and custom formatting.
#'
#' @param label A character vector representing the main title text.
#' @param number A character or numeric value indicating the figure number. This will be converted to a character.
#' @param subtitle A subtitle for the plot. Defaults to `waiver()`, which means no subtitle is added.
#'
#' @return A list modifying the plot's title and subtitle, to be used within a ggplot chain.
#' @export
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#' p <- ggplot(mtcars, aes(x = wt, y = mpg)) +
#'   geom_point() +
#'   add_sano_title(label = "Car Weight vs. MPG", number = 1)
#' print(p)
#' }
add_sano_title <- function(label, number, subtitle = ggplot2::waiver()) {
  # Validate that 'label' is a character vector
  if (!is.character(label)) {
    stop("The 'label' must be a character vector.")
  }

  # Validate that 'number' is either numeric or character
  if (!is.numeric(number) && !is.character(number)) {
    stop("The 'number' must be either numeric or character.")
  }

  # Convert 'number' to character
  number <- as.character(number)

  # Format the title with specified styles
  label <- sprintf(
    "<span style='font-family:Arial;font-weight:bold;color:#3aaa35;'>Figure %s</span>
     <span style='font-family:Arial;font-weight:bold;color:#bccf00;'>●</span>
     <span style='font-family:Arial;font-weight:bold;color:#4d4d4d;'>%s</span>",
    number, label
  )

  # Return the labs() function with the formatted title and subtitle
  ggplot2::labs(title = label, subtitle = subtitle)
}
