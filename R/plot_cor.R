#' Runtime vs ED95 correlation plot
#'
#' @inheritParams default_params_doc
#'
#' @return
#' Saves runtime vs ED95 correlation plot to working directory as .png file.
#' @author Pedro Neves
#' @export
#'
plot_cor <- function(param_space_data_frame) {

  metrics <- c(
    "ed95_spec_nltt",
    "ed95_endemic_nltt",
    "ed95_nonendemic_nltt",
    "ed95_num_spec",
    "ed95_num_col"
  )
  param_space_name <- param_space_data_frame$param_space_name[1]

  if (param_space_name == "oceanic_ontogeny") {
    param_space_label <- "Oceanic ontogeny"
  } else if (param_space_name == "oceanic_ontogeny_sea_level") {
    param_space_label <- "Oceanic ontogeny sea-level"
  } else if (param_space_name == "oceanic_sea_level") {
    param_space_label <- "Oceanic sea-level"
  } else if (param_space_name == "nonoceanic") {
    param_space_label <- "Non-oceanic"
  } else if (param_space_name == "nonoceanic_land_bridge") {
    param_space_label <- "Non-oceanic land-bridge"
  }

  plots <- list()
  for (i in seq_along(metrics)) {
    if (metrics[i] == "ed95_spec_nltt") {
      error_label <- expression(ED95[95] ~ Delta * "STT")
    } else if (metrics[i] == "ed95_endemic_nltt") {
      error_label <- expression(ED95[95] ~ Delta * "ESTT")
    } else if (metrics[i] == "ed95_nonendemic_nltt") {
      error_label <- expression(ED95[95] ~ Delta * "NESTT")
    } else if (metrics[i] == "ed95_num_spec") {
      error_label <- expression(ED95[95] * " Species Number")
    } else if (metrics[i] == "ed95_num_col") {
      error_label <- expression(ED95[95] * " Colonist Number")
    }

    plots[[i]] <- ggplot2::ggplot(
      data = param_space_data_frame,
      ggplot2::aes(x = runtime, y = .data[[metrics[i]]])) +
      ggplot2::theme_bw() +
      ggplot2::geom_point(size = 0.3) +
      ggplot2::geom_smooth(method = "lm",
                           formula = y ~ x,
                           se = FALSE,
                           size = 0.7) +
      ggplot2::coord_cartesian(ylim = c(0, 1)) +
      ggplot2::ylab(error_label) +
      ggplot2::xlab("Run time in seconds") +
      ggplot2::theme(axis.title.y = ggplot2::element_text(size = 7)) +
      ggplot2::theme(axis.title.x = ggplot2::element_text(size = 7)) +
      ggplot2::theme(axis.text.x = ggplot2::element_text(size = 7)) +
      ggplot2::theme(axis.text.y = ggplot2::element_text(size = 7)) +
      ggplot2::theme(plot.margin = ggplot2::margin(6, 0.3, 6, 0.3))
  }


  faceted_plot <- cowplot::plot_grid(
    plots[[1]], plots[[2]], plots[[3]], plots[[4]], plots[[5]],
        align = "vh",
    labels = c("a", "b", "c", "d", "e"),
    hjust = -0.10,
    nrow = 2
  )

  # now add the title
  title <- cowplot::ggdraw() +
    cowplot::draw_label(
      param_space_label,
      fontface = "bold",
      x = 0,
      hjust = 0
    ) +
    ggplot2::theme(
      # add margin on the left of the drawing canvas,
      # so title is aligned with left edge of first plot
      plot.margin = ggplot2::margin(0, 0, 0, 7)
    )
  faceted_plot <- cowplot::plot_grid(
    title, faceted_plot,
    ncol = 1,
    # rel_heights values control vertical title margins
    rel_heights = c(0.1, 1)
  )

  ggplot2::ggsave(
    plot = faceted_plot,
    filename = paste0("runtime_ed95_corr_", param_space_name, ".png"),
    device = "png",
    width = 168,
    height = 100,
    units = "mm",
    dpi = 600
  )
}
