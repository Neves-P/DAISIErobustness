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

    # Remove legends and titles
    plot_left <- plot_list_1[[i]] + ggplot2::theme(
      axis.title.x = ggplot2::element_blank(),
      legend.position = "top") +
      ggplot2::coord_cartesian(ylim = c(0, faceted_ylim))
    plot_mid <- plot_list_2[[i]] + ggplot2::theme(
      axis.title.y = eval(parse(text = as.character(axis_title_y))),
      axis.text.y = ggplot2::element_blank(),
      axis.title.x = ggplot2::element_blank(),
      legend.position = "top") +
      ggplot2::coord_cartesian(ylim = c(0, faceted_ylim))
    plot_right <- plot_list_3[[i]] + ggplot2::theme(
      axis.title.y = eval(parse(text = as.character(axis_title_y))),
      axis.text.y = ggplot2::element_blank(),
      axis.title.x = ggplot2::element_blank(),
      legend.position = "top") +
      ggplot2::coord_cartesian(ylim = c(0, faceted_ylim))



    patchwork <- patchwork::guide_area() + patchwork::wrap_plots(
      plot_left,
      plot_mid,
      plot_right) + patchwork::plot_layout(
        nrow = 2,
        heights = c(0.05, 15),
        guides = "collect"
      ) + patchwork::plot_annotation(
        tag_levels = "a",
        tag_prefix = "(",
        tag_suffix = ")"
      ) & ggplot2::theme(
        legend.position = "top",
        plot.tag = ggplot2::element_text(size = 8, hjust = 0.2, vjust = 1),
        plot.tag.position = c(0, 1)
      )

    final_plot <- cowplot::add_sub(
      patchwork,
      sub_text,
      vpadding = grid::unit(0, "lines"),
      y = 5,
      x = 0.5,
      vjust = 6,
      size = 8
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
      height = 60,
      units = "mm",
      dpi = 600
    )

    ggplot2::ggsave(
      plot = final_plot,
      filename = paste0(filename, ".pdf"),
      device = "pdf",
      width = 168,
      height = 60,
      units = "mm"
    )
  }
}
