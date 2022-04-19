plot_error_stripchart_grouped <- function(scenario_res,
                                          error = "spec_nltt",
                                          xlabels,
                                          x_axis_text,
                                          scenario,
                                          save,
                                          add_plot_title = TRUE) {

  # y axis labels
  if (error == "ed95_spec_nltt") {
    error_label <- expression(ED[95] ~ Delta * "STT")
  } else if (error == "ed95_endemic_nltt") {
    error_label <- expression(ED[95] ~ Delta * "ESTT")
  } else if (error == "ed95_nonendemic_nltt") {
    error_label <- expression(ED[95] ~ Delta * "NESTT")
  } else if (error == "ed95_num_spec") {
    error_label <- expression(ED[95] * " N Spec")
  } else if (error == "ed95_num_col") {
    error_label <- expression(ED[95] * " N Col")
  }

  # Title
  if (scenario == "oceanic_sea_level") {
    plot_title <- "Oceanic sea-level"
  } else if (scenario == "oceanic_ontogeny") {
    plot_title <- "Oceanic ontogeny"
  } else if (scenario == "oceanic_ontogeny_sea_level") {
    plot_title <- "Oceanic ontogeny + sea-level"
  } else if (scenario == "nonoceanic") {
    plot_title <- "Continental"
  } else if (scenario == "nonoceanic_land_bridge") {
    plot_title <- "Continental land-bridge"
  }

  # N labels
  label_ns <- c()
  ns <- tidy_data(scenario_res = scenario_res, partition_by = partition_by)
  aggregate(ns$n, by = list(key = ns$key), sum)
  n_ages <- length(unique(ns$Island))
  for (i in seq_along(unique(ns$key))) {
    matched_ns <- as.character(ns$n[which(ns$key[i] == ns$key)])
    matched_n_y <- matched_ns[1]
    matched_n_o <- matched_ns[2]
    matched_n_a <- matched_ns[3]
    if (n_ages == 2) {
      label_ns[i] <- glue::glue(
        paste0(
          xlabels[i],
          "  \nN<sub>K</sub> = {matched_n_y}  \nN<sub>M</sub> = {matched_n_o}"
        )
      )
      colours <- c("#8DA0CB", "#E78AC3")
    } else if (n_ages == 3) {
      label_ns[i] <- glue::glue(
        paste0(
          xlabels[i],
          "  \nN<sub>Y</sub> = {matched_n_y}  \nN<sub>O</sub> = {matched_n_o}  \nN<sub>A</sub> = {matched_n_a}"
        )
      )
      colours <- c("#A6D854", "#FFD92F", "#E5C494")
    }
  }
  xlabels <- label_ns
  # Generate plot
  p <- ggplot2::ggplot(data = scenario_res, ggplot2::aes(y = get(error), x = key, color = Island)) +
    ggplot2::theme_classic() +
    ggplot2::geom_jitter(position = ggplot2::position_jitterdodge(0.2)) +
    ggplot2::scale_colour_manual(values = colours) +
    ggplot2::scale_x_discrete(labels = xlabels) +
    ggplot2::geom_hline(yintercept = 0.05, linetype = "dashed", size = 0.5) +
    ggplot2::xlab(x_axis_text) +
    ggplot2::ylab(error_label) +
    ggplot2::theme(axis.title.y = ggplot2::element_text(size = 8)) +
    ggplot2::theme(axis.title.x = ggplot2::element_text(size = 8)) +
    ggplot2::theme(axis.text.y = ggplot2::element_text(size = 8)) +
    ggplot2::theme(axis.text.x = ggtext::element_markdown(size = 6)) +
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


