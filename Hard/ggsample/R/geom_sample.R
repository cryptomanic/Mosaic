#' Triangular shape points for displaying scatterplot
#'
#' The triangle point (triangle shape) geom is used to create scatterplot
#'
#' The scatterplot is useful for displaying the relationship between two
#' continuous variables.
#'
#' @param mapping Set of aesthetic mappings created
#'  by aes or aes_. If specified and inherit.aes = TRUE
#'  (the default), is combined with the default mapping at
#'  the top level of the plot. You only need to supply
#'  mapping if there isn't a mapping defined for the plot.
#'
#' @param data  data frame. If specified, overrides the default
#'  data frame defined at the top level of the plot.
#'
#' @param stat The statistical transformation to use on
#'  the data for this layer, as a string.
#'
#' @param position Position adjustment, either as a string,
#'  or the result of a call to a position adjustment function.
#'
#' @param na.rm f FALSE (the default), removes missing values
#'  with a warning. If TRUE silently removes missing values.
#'
#' @param show.legend logical. Should this layer be included in
#'  the legends? NA, the default, includes if any aesthetics are
#'  mapped. FALSE never includes, and TRUE always includes.
#'
#' @param inherit.aes If FALSE, overrides the default aesthetics,
#'  rather than combining with them. This is most useful for helper
#'  functions that define both data and aesthetics and shouldn't inherit
#'  behaviour from the default plot specification
#'
#' @param ... other arguments passed on to layer. These are
#' often aesthetics, used to set an aesthetic to a fixed value, like
#' \code{color = "red"} or \code{size = 3}. They may also be parameters
#' to the paired geom/stat
#'
 #' @examples
#' p <- ggplot(cars, aes(speed, dist))
#' p + geom_triangle_point()
#'
#' @export

geom_triangle_point <-
  function(mapping = NULL, data = NULL, stat = "identity",
           position = "identity", na.rm = FALSE, show.legend = NA,
           inherit.aes = TRUE, ...) {
    layer(
      geom = GeomTrianglePoint, mapping = mapping,  data = data, stat = stat,
      position = position, show.legend = show.legend, inherit.aes = inherit.aes,
      params = list(na.rm = na.rm, ...)
    )
  }

#' @export
GeomTrianglePoint <- ggplot2::ggproto(
  "GeomTrianglePoint", Geom,
  required_aes = c("x", "y"),
  default_aes = aes(shape = 24, colour = "black"),
  draw_key = draw_key_point,

  draw_panel = function(data, panel_scales, coord) {
    coords <- coord$transform(data, panel_scales)
    grid::pointsGrob(
      coords$x, coords$y,
      pch = coords$shape,
      gp = grid::gpar(col = coords$colour)
    )
  }
)
