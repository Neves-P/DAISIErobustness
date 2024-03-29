#' Runtime vs ED95 correlation plot
#'
#' @inheritParams default_params_doc
#'
#' @return
#' Saves runtime vs ED95 correlation plot to working directory as .png file.
#' @author Pedro Santos Neves
#' @export
#'
plot_cor <- function(param_space_data_frame,
                     folder_path = ".") {

  metrics <- c(
    "ed95_spec_nltt",
    "ed95_endemic_nltt",
    "ed95_nonendemic_nltt",
    "ed95_num_spec",
    "ed95_num_col"
  )

  plots <- list()
  for (i in seq_along(metrics)) {
    if (metrics[i] == "ed95_spec_nltt") {
      error_label <- expression(ED[95] ~ Delta * "STT")
    } else if (metrics[i] == "ed95_endemic_nltt") {
      error_label <- expression(ED[95] ~ Delta * "ESTT")
    } else if (metrics[i] == "ed95_nonendemic_nltt") {
      error_label <- expression(ED[95] ~ Delta * "NESTT")
    } else if (metrics[i] == "ed95_num_spec") {
      error_label <- expression(ED[95] * " Species Number")
    } else if (metrics[i] == "ed95_num_col") {
      error_label <- expression(ED[95] * " Colonist Number")
    }

    runtime <- NULL # ggplot2 nonstandard evalution hack
    .data <- NULL
    plots[[i]] <- ggplot2::ggplot(
      data = param_space_data_frame,
      ggplot2::aes(x = runtime, y = .data[[metrics[i]]])) +
      ggplot2::theme_classic() +
      ggplot2::scale_x_continuous() +
      ggplot2::geom_point(size = 0.3) +
      ggplot2::geom_smooth(method = "lm",
                           formula = y ~ x,
                           se = FALSE,
                           size = 0.7) +
      ggplot2::coord_cartesian(ylim = c(0, 1)) +
      ggplot2::ylab(error_label) +
      ggplot2::xlab("Run time in seconds") +
      ggplot2::theme(axis.title.y = ggplot2::element_text(size = 8)) +
      ggplot2::theme(axis.title.x = ggplot2::element_text(size = 8)) +
      ggplot2::theme(axis.text.x = ggplot2::element_text(size = 8)) +
      ggplot2::theme(axis.text.y = ggplot2::element_text(size = 8)) +
      ggplot2::theme(plot.margin = ggplot2::margin(6, 0.3, 6, 0.3))
  }

  faceted_plot <- cowplot::plot_grid(
    plots[[1]], plots[[2]], plots[[3]], plots[[4]], plots[[5]],
        align = "vh",
    labels = c("(a)", "(b)", "(c)", "(d)", "(e)"),
    label_size = 8,
    hjust = -0.10,
    nrow = 2
  )


  ggplot2::ggsave(
    plot = faceted_plot,
    filename = file.path(folder_path, "JBI-21-0508_FigS1.png"),
    device = "png",
    width = 168,
    height = 60,
    units = "mm",
    dpi = 600
  )
  ggplot2::ggsave(
    plot = faceted_plot,
    filename = file.path(folder_path, "JBI-21-0508_FigS1.pdf"),
    device = "pdf",
    width = 168,
    height = 60,
    units = "mm"
  )
}
