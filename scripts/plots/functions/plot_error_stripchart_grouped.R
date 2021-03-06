plot_error_stripchart_grouped <- function(data_n_df,
                                          error = "spec_nltt",
                                          xlabels,
                                          x_axis_text,
                                          scenario,
                                          n_ages,
                                          save,
                                          add_plot_title = TRUE) {

  # y axis labels
  if (error == "spec_nltt") {
    error_label <- expression(ED[95] ~ Delta * "STT")
  } else if (error == "endemic_nltt") {
    error_label <- expression(ED[95] ~ Delta * "ESTT")
  } else if (error == "nonendemic_nltt") {
    error_label <- expression(ED[95] ~ Delta * "NESTT")
  } else if (error == "num_spec") {
    error_label <- expression(ED[95] * " N Spec")
  } else if (error == "num_col") {
    error_label <- expression(ED[95] * " N Col")
  }

  # Title
  if (scenario == "oceanic_sea_level") {
    plot_title <- "Oceanic sea-level"
  } else if (scenario == "oceanic_ontogeny") {
    plot_title <- "Oceanic ontogeny"
  } else if (scenario == "oceanic_ontogeny_sea_level") {
    plot_title <- "Oceanic ontogeny sea-level"
  } else if (scenario == "nonoceanic") {
    plot_title <- "Continental"
  } else if (scenario == "nonoceanic_land_bridge") {
    plot_title <- "Continental land-bridge"
  }
  data <- data_n_df$data
  n_df <- data_n_df$n_df

  label_ns <- c()
  for (i in seq_along(unique(n_df$key))) {
    matched_ns <- as.character(n_df$n[which(n_df$key[i] == n_df$key)])
    matched_n_y <- matched_ns[1]
    matched_n_o <- matched_ns[2]
    matched_n_a <- matched_ns[3]
    if (n_ages == 2) {
      label_ns[i] <- glue::glue(
        paste0(
          xlabels[i],
          "  \nN<sub>Y</sub> = {matched_n_y}  \nN<sub>O</sub> = {matched_n_o}"
        )
      )
    } else if (n_ages == 3) {
      label_ns[i] <- glue::glue(
        paste0(
          xlabels[i],
          "  \nN<sub>Y</sub> = {matched_n_y}  \nN<sub>O</sub> = {matched_n_o}  \nN<sub>A</sub> = {matched_n_a}"
        )
      )
    }
  }
  xlabels <- label_ns
  # Generate plot
  p <- ggplot2::ggplot(data = data, ggplot2::aes(y = value, x = key, color = Island)) +
    ggplot2::theme_bw() +
    ggplot2::geom_jitter(position = ggplot2::position_jitterdodge(0.2)) +
    ggplot2::scale_color_brewer(palette = "Set2") +
    ggplot2::scale_x_discrete(labels = xlabels) +
    ggplot2::geom_hline(yintercept = 0.05, linetype = "dashed", size = 0.5) +
    ggplot2::xlab(x_axis_text) +
    ggplot2::ylab(error_label) +
    ggplot2::theme(axis.title.y = ggplot2::element_text(size = 8)) +
    ggplot2::theme(axis.title.x = ggplot2::element_text(size = 8)) +
    ggplot2::theme(axis.text.y = ggplot2::element_text(size = 8)) +
    ggplot2::theme(axis.text.x = ggtext::element_markdown(size = 7)) +
    ggplot2::theme(legend.text = ggplot2::element_text(size = 8)) +
    ggplot2::theme(legend.title = ggplot2::element_text(size = 8)) +
    ggplot2::guides(fill = ggplot2::guide_legend(title = "Island")) +
    ggplot2::theme(plot.margin = ggplot2::margin(6, 0.2, 6, 0.2)) +
    ggplot2::theme(legend.text.align = 0)
  if (add_plot_title) {
    p <- p + ggplot2::ggtitle(plot_title) +
      ggplot2::theme(plot.title = ggplot2::element_text(size = 10, hjust = 0.5))
  }
  p
}


