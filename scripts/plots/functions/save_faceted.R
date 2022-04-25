saved_faceted <- function(plot_list_1,
                          plot_list_2,
                          plot_list_3,
                          sub_text,
                          save_name = NULL) {


  for (i in seq_along(plot_list_1)) {

    # Figure out ylim
    plot_1_ylim <- ggplot2::layer_scales(plot_list_1[[i]])$y$range$range[2]
    plot_2_ylim <- ggplot2::layer_scales(plot_list_2[[i]])$y$range$range[2]
    plot_3_ylim <- ggplot2::layer_scales(plot_list_3[[i]])$y$range$range[2]
    faceted_ylim <- max(plot_1_ylim, plot_2_ylim, plot_3_ylim)

    # Figure out if y title is the same
    identical_y_title <- all(identical(
      plot_list_1[[i]]$labels$y,
      plot_list_2[[i]]$labels$y
    ),
    identical(
      plot_list_1[[i]]$labels$y,
      plot_list_3[[i]]$labels$y
    ))
    if (identical_y_title) {
      axis_title_y <- "ggplot2::element_blank()"

    } else {
      axis_title_y <- "ggplot2::element_text()"
    }


    # Make plot grid, remove legends and titles
  prow <- cowplot::plot_grid(
    plot_list_1[[i]] + ggplot2::theme(
      legend.position = "none",
      axis.title.x = ggplot2::element_blank()) +
      ggplot2::coord_cartesian(ylim = c(0, faceted_ylim)),
    plot_list_2[[i]] + ggplot2::theme(
      legend.position = "none",
      axis.title.y = eval(parse(text = as.character(axis_title_y))),
      axis.title.x = ggplot2::element_blank()) +
      ggplot2::coord_cartesian(ylim = c(0, faceted_ylim)),
    plot_list_3[[i]] + ggplot2::theme(
      legend.position = "none",
      axis.title.y = eval(parse(text = as.character(axis_title_y))),
      axis.title.x = ggplot2::element_blank()
    ) + ggplot2::coord_cartesian(ylim = c(0, faceted_ylim)),
    align = 'vh',
    labels = c("(a)", "(b)", "(c)"),
    label_size = 10.5,
    hjust = -0.2,
    nrow = 1
  )

  legend <- cowplot::get_legend(
    # create some space to the left of the legend
    plot_list_1[[1]] + ggplot2::theme(
      legend.box.margin = ggplot2::margin(0, 0, 0, 4)
    )
  )

  prow_legend <- cowplot::plot_grid(
    prow,
    legend,
    rel_widths = c(3, 0.4)
  )

  final_plot <- cowplot::add_sub(
    prow_legend,
    sub_text,
    vpadding = grid::unit(0, "lines"),
    y = 5,
    x = 0.5,
    vjust = 4.5,
    size = 10
  )

  name_suffix <- switch(
    i,
    "_spec_nltt",
    "_endemic",
    "_nonendemic",
    "_num_spec",
    "_num_col"
  )

  filename <- ifelse(
    is.null(save_name),
    paste0(sub_text, name_suffix),
    save_name
  )

  ggplot2::ggsave(
    plot = final_plot,
    filename = paste0(filename, ".png"),
    device = "png",
    width = 168,
    height = 100,
    units = "mm",
    dpi = 600
  )
  ggplot2::ggsave(
    plot = final_plot,
    filename = paste0(filename, ".pdf"),
    device = "pdf",
    width = 168,
    height = 100,
    units = "mm"
  )
  }
}
